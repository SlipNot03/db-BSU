class Reader < Sequel::Model(:readers)
    plugin :validation_helpers
    
    many_to_many :books, class: :Book, join_table: :readers_books, left_key: :reader_id, right_key: :book_id
    one_to_one :black_list, class: :BlackList
    
    def validate
        super
        #Проверка на пустоту
        validates_presence [:first_name, :second_name, :email, :birth_date, :phone_number, :address]

        #Проверка уникальности
        validates_unique :email, message: 'Такой email уже зарегистрирован'
        validates_unique :phone_number, message: 'Такой номер телефона уже существует'

        #Проверка формата
        validates_format /@/, :email, message: 'Некорректный формат email'
        
        # Проверка телефона
        validates_format /^\d{11}$/, :phone_number, message: 'Телефон должен содержать только цифры (11 символов)'
    end
end