require 'date'
Sequel.migration do
  up do
    readers_books_table = from(:readers_books)

    readers_books_table.multi_insert([
        {
            end_rental_time: Date.strptime('15012017', '%d%m%Y'),
            reader_id: 1,
            book_id: 1
        },
        {
            end_rental_time: Date.strptime('23052009', '%d%m%Y'),
            reader_id: 2,
            book_id: 2
        },
        {
            end_rental_time: Date.strptime('08032017', '%d%m%Y'),
            reader_id: 3,
            book_id: 3
        },
        {
            end_rental_time: Date.strptime('12112023', '%d%m%Y'),
            reader_id: 4,
            book_id: 4
        },
        {
            end_rental_time: Date.strptime('30072018', '%d%m%Y'),
            reader_id: 5,
            book_id: 5
        },
        {
            end_rental_time: Date.strptime('01092017', '%d%m%Y'),
            reader_id: 6,
            book_id: 6
        },
        {
            end_rental_time: Date.strptime('19042016', '%d%m%Y'),
            reader_id: 7,
            book_id: 7
        },
        {
            end_rental_time: Date.strptime('25122013', '%d%m%Y'),
            reader_id: 8,
            book_id: 8
        },
        {
            end_rental_time: Date.strptime('05062020', '%d%m%Y'),
            reader_id: 9,
            book_id: 9
        },
        {
            end_rental_time: Date.strptime('10102025', '%d%m%Y'),
            reader_id: 10,
            book_id: 10
        },
    ])
  end
  
    down do
      readers_books_table = from(:readers_books)
      readers_books_table.where{ id <= 10 }.delete
    end
end
