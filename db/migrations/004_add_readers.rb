# encoding: utf-8
require 'date'

Sequel.migration do
  up do
    readers_table = from(:readers)

    readers_table.multi_insert([
      {
        first_name: 'Иван',
        second_name: 'Иванов',
        patronimyc: 'Иванович',
        email: 'ivan.ivanov@example.com',
        birth_date: Date.strptime('15011990', '%d%m%Y'),
        phone_number: '79161234567',
        address: 'г. Москва, ул. Ленина, д. 1, кв. 10'
      },
      {
        first_name: 'Петр',
        second_name: 'Петров',
        patronimyc: 'Петрович',
        email: 'petr.petrov@example.com',
        birth_date: Date.strptime('23051985', '%d%m%Y'),
        phone_number: '79267654321',
        address: 'г. Санкт-Петербург, Невский пр-т, д. 25, кв. 5'
      },
      {
        first_name: 'Елена',
        second_name: 'Сидорова',
        patronimyc: 'Игоревна',
        email: 'elena.sidorova@example.com',
        birth_date: Date.strptime('08031992', '%d%m%Y'),
        phone_number: '79039876543',
        address: 'г. Новосибирск, ул. Красный проспект, д. 50, кв. 112'
      },
      {
        first_name: 'Ольга',
        second_name: 'Кузнецова',
        patronimyc: 'Сергеевна',
        email: 'olga.kuznetsova@example.com',
        birth_date: Date.strptime('12111988', '%d%m%Y'),
        phone_number: '79051112233',
        address: 'г. Екатеринбург, ул. Малышева, д. 30, кв. 45'
      },
      {
        first_name: 'Сергей',
        second_name: 'Васильев',
        patronimyc: 'Николаевич',
        email: 'sergey.vasiliev@example.com',
        birth_date: Date.strptime('30071979', '%d%m%Y'),
        phone_number: '79115556677',
        address: 'г. Казань, ул. Баумана, д. 15, кв. 8'
      },
      {
        first_name: 'Мария',
        second_name: 'Павлова',
        patronimyc: 'Денисовна',
        email: 'maria.pavlova@example.com',
        birth_date: Date.strptime('01092001', '%d%m%Y'),
        phone_number: '79218889900',
        address: 'г. Нижний Новгород, ул. Большая Покровская, д. 70, кв. 3'
      },
      {
        first_name: 'Алексей',
        second_name: 'Смирнов',
        patronimyc: 'Алексеевич',
        email: 'alexey.smirnov@example.com',
        birth_date: Date.strptime('19041995', '%d%m%Y'),
        phone_number: '79652345678',
        address: 'г. Самара, ул. Куйбышева, д. 100, кв. 21'
      },
      {
        first_name: 'Татьяна',
        second_name: 'Волкова',
        patronimyc: 'Дмитриевна',
        email: 'tatiana.volkova@example.com',
        birth_date: Date.strptime('25121983', '%d%m%Y'),
        phone_number: '79178765432',
        address: 'г. Омск, ул. Иртышская набережная, д. 12, кв. 67'
      },
      {
        first_name: 'Дмитрий',
        second_name: 'Попов',
        patronimyc: 'Владимирович',
        email: 'dmitry.popov@example.com',
        birth_date: Date.strptime('05061998', '%d%m%Y'),
        phone_number: '79093456789',
        address: 'г. Челябинск, пр-т Ленина, д. 60, кв. 99'
      },
      {
        first_name: 'Анна',
        second_name: 'Лебедева',
        patronimyc: 'Андреевна',
        email: 'anna.lebedeva@example.com',
        birth_date: Date.strptime('10102000', '%d%m%Y'),
        phone_number: '79279012345',
        address: 'г. Ростов-на-Дону, ул. Большая Садовая, д. 45, кв. 15'
      }
    ])
  end

  down do
    emails_to_delete = [
      'ivan.ivanov@example.com', 'petr.petrov@example.com',
      'elena.sidorova@example.com', 'olga.kuznetsova@example.com',
      'sergey.vasiliev@example.com', 'maria.pavlova@example.com',
      'alexey.smirnov@example.com', 'tatiana.volkova@example.com',
      'dmitry.popov@example.com', 'anna.lebedeva@example.com'
    ]
    
    from(:readers).where(email: emails_to_delete).delete
  end
end