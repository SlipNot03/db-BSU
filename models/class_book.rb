class Book < Sequel::Model(:books)
    plugin :validation_helpers

    many_to_many :readers, class: :Reader, join_table: :readers_books, left_key: :book_id, right_key: :reader_id

    def validate
        super
        #Обязательные поля
        required_fields = [:title, :author, :publisher, :place_of_publication, 
                        :year_of_publication, :isbn, :number_of_pages, :description]
        validates_presence required_fields

        #Уникальность ISBN
        validates_unique :isbn, message: 'Книга с таким ISBN уже существует'

        #Проверка длины ISBN
        validates_min_length 13, :isbn, message: 'ISBN слишком короткий'

        #Год издания должен быть числом из 4 цифр
        validates_format /^\d{4}$/, :year_of_publication, message: 'Год издания должен быть из 4 цифр'
        
        #Количество страниц должно быть числом
        validates_format /^\d+$/, :number_of_pages, message: 'Количество страниц должно быть числом'
    end

    
end