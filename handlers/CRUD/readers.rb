require_relative 'base.rb'
class ReadersCrud < BaseCrud
  def self.model
    Reader
  end

  def self.labels
    {
      id: "ID",
      first_name: "Имя",
      second_name: "Фамилия",
      patronimyc: "Отчество",
      email: "Email",
      birth_date: "Дата рождения (ддммгггг)",
      phone_number: "Телефон",
      address: "Адрес"
    }
  end
end