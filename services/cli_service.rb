class CliService

  def self.run_request
    @result_request = []
    @result_request[0],@result_request[1] = entity_request,operation_request
    return @result_request
  end


  private 

  def self.entity_valid(value)
    if value > 5 || value <= 0
      puts 'Выберите корректную сущность'
      run_request
      return 
    elsif value == 5
      exit
    else
      @entity = value
    end
  end

  def self.operation_valid(value)
    if value > 6 || value <= 0
      puts "Выберите корректную операцию"
      return operation_request
    elsif value == 6
      run_request
      return 
    else
      @operation = value
    end
  end

  def self.entity_request
    puts(
      'Выберите сущность
      1.Читатели
      2.Книги
      3.Журнал(таблица пересечений)
      4.Черный список
      5.Выход'
      )
    entity_valid(gets.chomp.to_i)
  end

  def self.operation_request
    puts(
      'Выберите CRUD-операцию
      1.Создать
      2.Вывести все записи в таблице
      3.Найти по id
      4.Изменить по id
      5.Удалить по id
      6.Вернуться к сущностям'
      )
    operation_valid(gets.chomp.to_i)
  end

end
