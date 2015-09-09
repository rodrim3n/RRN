DB = Sequel.connect('mysql://localhost/RRN', :user=>'root', :password=>'1234')

if !DB.table_exists?(:notes)
  DB.create_table :notes do
    primary_key :id
    String :title
    String :description
  end
end
