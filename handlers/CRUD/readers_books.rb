require_relative 'base.rb'
class ReadersBooksCrud < BaseCrud

  def self.model
    ReaderBook
  end

  def self.labels
    {
      id: "ID Записи",
      reader_id: "ID Читателя",
      book_id: "ID Книги",
      end_rental_time: "Дата возврата (ддммгггг)"
    }
  end
  
end