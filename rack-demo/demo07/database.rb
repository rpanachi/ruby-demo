require "sequel"
require "sqlite3"

DB = Sequel.connect("sqlite://demo.db")

DB.create_table(:people) do
  primary_key :id
  String      :name, size: 100
  Integer     :age
end unless DB.table_exists?(:people)

people = DB[:people]
people.insert(name: "Bob Smith", age: 30)
people.insert(name: "Alice Rodriguez", age: 22)
people.insert(name: "Matz Luby", age: 50)
