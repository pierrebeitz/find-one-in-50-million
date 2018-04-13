require 'sequel'
require 'mysql2'

DB = Sequel.connect(:adapter => 'mysql2', :user => 'root', :host => 'localhost', :database => 'test', :password=>'password')

DB.create_table! :items do
  primary_key :id
  String :key
end

items = DB[:items] # Create a dataset

# Populate the table
batch = 100000
(50_000_000 / batch).times do |i|
  puts i * batch
  items.import([:key], (1..batch).map { |j| "some_key#{ (i * batch) + j }_thats" })
end

# SELECT * FROM test.items WHERE items.key = "some_key49995724";
# -> 17sec

# SELECT EXISTS (SELECT * FROM test.items WHERE items.key = "some_key49995724");
# -> 16sec

# Added index
# -> 6ms
