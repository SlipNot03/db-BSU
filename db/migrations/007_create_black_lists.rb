Sequel.migration do
  change do
    create_table(:black_lists) do
        primary_key :id
        Date :end_punishment, null: false

        foreign_key :reader_id, :readers, null: false, on_delete: :cascade

    end
  end
end