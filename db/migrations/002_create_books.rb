Sequel.migration do
  change do
    create_table(:books) do
        primary_key :id
        String :title, null: false
        String :author, null: false
        String :publisher, null: false
        String :place_of_publication, null: false
        String :year_of_publication, null: false
        String :isbn, null: false, unique: true
        String :number_of_pages, null: false
        String :description, null: false
    end
  end
end