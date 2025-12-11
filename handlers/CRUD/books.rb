require_relative 'base.rb'
class BooksCrud < BaseCrud
  def self.model
    Book
  end

  def self.labels
    {
      id: "ID",
      title: "Название книги",
      author: "Автор",
      publisher: "Издательство",
      place_of_publication: "Место издания",
      year_of_publication: "Год издания",
      isbn: "ISBN",
      number_of_pages: "Кол-во страниц",
      description: "Описание"
    }
  end
end