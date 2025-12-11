Sequel.migration do
  change do
    create_table(:readers) do
        primary_key :id
        String :first_name, null: false
        String :second_name, null: false
        String :patronimyc, null: true
        String :email, null: false, unique: true
        Date :birth_date, null: false
        String :phone_number, null: false, unique: true
        Text :address, null: false
    end
  end
end