require 'sequel'
require 'pg'
require_relative 'Config'
# Подключение
DB = Sequel.connect(Config.db_string)
Sequel::Model.db = DB # Важно для моделей!
MIGRATIONS_PATH = '/home/klenetev/work/rb_project/institute/data_base/db/migrations' #абсолютный путь к файлам миграций