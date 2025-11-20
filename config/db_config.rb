require 'sequel'
require 'logger'

DATABASE_URL = ENV.fetch('DATABASE_URL', 'postgres://postgres:postgres@localhost/institute_db')

MIGRATIONS_PATH = 'db/migrations'