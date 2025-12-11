class BlackList < Sequel::Model(:black_lists)
  plugin :validation_helpers
  
  many_to_one :reader, class: :Reader, key: :reader_id

  def validate
    super
    #Обязательные поля
    validates_presence [:reader_id, :end_punishment]

    #Уникальность
    validates_unique :reader_id, message: 'Этот читатель уже находится в черном списке'

    #Наказание не может заканчиваться в прошлом
    should_validate_date = new? || changed_columns.include?(:end_punishment)

    if should_validate_date && end_punishment && end_punishment < Date.today
      errors.add(:end_punishment, 'Дата окончания наказания не может быть в прошлом')
    end
    
  end
end