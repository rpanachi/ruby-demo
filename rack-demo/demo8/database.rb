require "sequel"
require "sqlite3"

Sequel.extension(:migration)

DB = Sequel.connect("sqlite://demo.db")
