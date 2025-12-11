require_relative '/home/klenetev/work/rb_project/institute/data_base/config/database.rb'
require_relative '/home/klenetev/work/rb_project/institute/data_base/models/class_reader.rb'
require_relative '/home/klenetev/work/rb_project/institute/data_base/models/class_book.rb'
require_relative '/home/klenetev/work/rb_project/institute/data_base/models/class_reader_book.rb'
require 'terminal-table'
require 'date'

class BaseCrud

  def self.model
    raise NotImplementedError, "Define model in child class"
  end

  def self.labels
    raise NotImplementedError, "Define labels hash in child class"
  end

  def self.menu(choice)
    case choice
    when 1 then create
    when 2 then list
    when 3 then find_by_id
    when 4 then update_by_id
    when 5 then delete_by_id
    else puts "Неверный выбор"
    end
  end

  private

  def self.create
    attributes = {}
    cols = model.columns - [:id]

    puts "--- Создание записи в #{model} ---"
    
    cols.each do |key|
      label = labels[key] || key.to_s
      puts "Введите #{label}:"
      
      input = gets.chomp
      input = type_cast(key, input)
      
      attributes[key] = input
    end

    begin
      model.create(attributes)
      puts "Запись успешно создана!"
    rescue Sequel::ValidationFailed => e
      puts "Ошибка валидации данных:"
      e.errors.full_messages.each { |msg| puts " - #{msg}" }
    rescue Sequel::UniqueConstraintViolation => e
       puts "Такая запись уже существует (дубликат)."
    rescue Sequel::ForeignKeyConstraintViolation => e
       puts "Указан несуществующий ID книги или читателя."
    rescue Sequel::Error => e
      puts "Ошибка базы данных: #{e.message}"
    end
  end

  def self.list
    records = model.all
    
    if records.empty?
      puts "Список пуст."
      return
    end

    headings = model.columns.map { |c| labels[c] || c }
    rows = records.map { |r| r.values.values }

    table = Terminal::Table.new do |t|
      t.headings = headings
      t.rows = rows
      t.style = { border: :unicode }
    end
    puts table
  end

  def self.find_by_id
    record = ask_id_and_find
    return unless record
    # headings = model.columns.map { |c| labels[c] || c }
    table = Terminal::Table.new do |t|
      t.title = "Карточка ID: #{record.id}"
      t.headings = ['Поле', 'Значение']
      t.style = { border: :unicode }
      model.columns.each do |col|
        t.add_row [labels[col] || col, record[col]]
        t.add_separator unless col == model.columns.last
      end
    end
    puts table
  end

  def self.update_by_id
    record = ask_id_and_find
    return unless record

    cols = model.columns - [:id] 
    loop do
      puts "\nЧто хотите изменить?"
      cols.each_with_index do |col, index|
        puts "#{index + 1}. #{labels[col] || col}"
      end
      puts "#{cols.size + 1}. Завершить"

      choice = gets.chomp.to_i

      if choice == cols.size + 1
        break
      elsif choice > 0 && choice <= cols.size
        target_col = cols[choice - 1] # -1 т.к. массив с 0
        
        puts "Введите новое значение для '#{labels[target_col]}':"
        new_val = gets.chomp
        new_val = type_cast(target_col, new_val)

        record[target_col] = new_val
        puts "Значение обновлено"
      else
        puts "Неверный выбор."
      end
    end

    begin
      record.save_changes
      puts "Все изменения сохранены в базу."
    rescue Sequel::ValidationFailed => e
      puts "Ошибка валидации данных:"
      e.errors.full_messages.each { |msg| puts " - #{msg}" }
    rescue Sequel::UniqueConstraintViolation => e
       puts "Такая запись уже существует (дубликат)."
    rescue Sequel::ForeignKeyConstraintViolation => e
       puts "Указан несуществующий ID книги или читателя."
    rescue Sequel::Error => e
      puts "Ошибка базы данных: #{e.message}"
    end
  end

  def self.delete_by_id
    record = ask_id_and_find
    return unless record

    record.delete
    puts "Запись с ID #{record.id} удалена."
  end

  def self.ask_id_and_find
    puts "Введите ID:"
    id = gets.chomp.to_i
    record = model[id]
    
    unless record
      puts "Запись с ID #{id} не найдена."
      return ask_id_and_find
    end
    record
  end

  def self.type_cast(column, value)
    schema = model.db_schema[column]
    return value if schema.nil?

    case schema[:type]
    when :date
      begin
        Date.strptime(value, "%d%m%Y")
      rescue Date::Error
        puts "Неверный формат даты! Используется сегодня."
        Date.today
      end
    when :integer
      value.to_i
    else
      value
    end
  end
end