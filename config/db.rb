DB = Sequel.connect('mysql://localhost/RRN', :user=>'root', :password=>'1234')

if !DB.table_exists?(:notes)
  DB.create_table :notes do
    primary_key :id
    String :title
    String :description
    String :image
    Date :date
  end
end
if !DB.table_exists?(:users)
  DB.create_table :users do
    primary_key :id
    String :username
    String :crypted_password
    unique :username
  end
end
