require_relative 'base.rb'
require_relative '/home/klenetev/work/rb_project/institute/data_base/models/class_black_list.rb'

class BlackListsCrud < BaseCrud
  def self.model
    BlackList
  end

  def self.labels
    {
      id: "ID Записи",
      reader_id: "ID Читателя",
      end_punishment: "Дата окончания наказания (ддммгггг)"
    }
  end
end