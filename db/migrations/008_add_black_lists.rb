require 'date'
Sequel.migration do
  up do
    black_lists_table = from(:black_lists)

    black_lists_table.multi_insert([
        {
            end_punishment: Date.strptime('15012025', '%d%m%Y'),
            reader_id: 1,
        },
        {
            end_punishment: Date.strptime('30072019', '%d%m%Y'),
            reader_id: 5,
        },
        {
            end_punishment: Date.strptime('19042018', '%d%m%Y'),
            reader_id: 7,
        }
        
    ])
  end
  
    down do
      black_lists_table = from(:black_lists)
      black_lists_table.where{ id <= 3 }.delete
    end
end
