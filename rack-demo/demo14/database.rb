require "sequel"
require "sqlite3"
require "./env"

Sequel.extension(:migration)

DB = Sequel.connect(ENV["DATABASE_URL"])
