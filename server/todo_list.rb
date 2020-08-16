require 'sinatra'
require 'sinatra/json'
require 'sinatra/cors'
require 'rom'
require 'rom-repository'

set :allow_origin, '*'
set :allow_methods, 'GET,HEAD,POST'
set :allow_headers, 'content-type,if-modified-since'
set :expose_headers, 'location,link'

rom = ROM.container(:sql, 'sqlite::memory') do |config|
  config.default.connection.create_table(:todos) do
    primary_key :id
    column :title, String, null: false
    column :description, String, null: false
    column :due_date, Date, null: true
  end

  config.relation(:todos) do
    schema(infer: true)
  end
end

class TodoRepo < ROM::Repository[:todos]
  def all
    todos.to_a
  end
end

todo_repo = TodoRepo.new(rom)

get '/todos' do
  json todo_repo.all
end
