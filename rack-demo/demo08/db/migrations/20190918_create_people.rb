Sequel.migration do
  up do
    create_table(:people) do
      primary_key :id
      String      :name, size: 100
      Integer     :age
    end
  end
  down do
    drop_table(:people)
  end
end
