class ReaderBook < Sequel::Model(:readers_books)
  plugin :validation_helpers

  # Настраиваем связи (для удобства)
  many_to_one :reader
  many_to_one :book

  def validate
    super
    #Обязательные поля
    validates_presence [:reader_id, :book_id, :end_rental_time]

    #Проверяем, что дата возврата не в прошлом
    should_validate_date = new? || changed_columns.include?(:end_rental_time)

    if should_validate_date && end_rental_time && end_rental_time < Date.today
      errors.add(:end_rental_time, 'Дата возврата не может быть в прошлом')
    end
    #Уникальность пары
    validates_unique [:reader_id, :book_id], message: 'Эта книга уже выдана данному читателю'
  end
end