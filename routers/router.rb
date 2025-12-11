require_relative '/home/klenetev/work/rb_project/institute/data_base/handlers/CRUD/books'
require_relative '/home/klenetev/work/rb_project/institute/data_base/handlers/CRUD/readers'
require_relative '/home/klenetev/work/rb_project/institute/data_base/handlers/CRUD/readers_books'
require_relative '/home/klenetev/work/rb_project/institute/data_base/handlers/CRUD/black_lists.rb'

class Router
  def self.run_router(result_request)
    case result_request[0]
    when 1
      ReadersCrud.menu(result_request[1])
    when 2
      BooksCrud.menu(result_request[1])
    when 3
      ReadersBooksCrud.menu(result_request[1])
    when 4
      BlackListsCrud.menu(result_request[1])
    else
      puts "Некорректные данные в роутере"
    end
  end
end