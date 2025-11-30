Sequel.migration do
    up do
      create_table(:readers_books) do
        primary_key :id
        Date :end_rental_time, null: false

        foreign_key :reader_id, :readers, null: false, on_delete: :cascade
        foreign_key :book_id, :books, null: false, on_delete: :cascade
      end
    end
    down do
      drop_table(:readers_books)
    end
end