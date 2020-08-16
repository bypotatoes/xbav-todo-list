require 'sinatra'
require 'sinatra/json'
require 'sinatra/cors'
require 'rom'
require 'rom-repository'
require 'pry'

set :allow_origin, '*'
set :allow_methods, 'GET,HEAD,POST,DELETE'
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
  commands :create

  def all
    todos.to_a
  end
end

todo_repo = TodoRepo.new(rom)

todo_seeds = [
  {
    title: 'Joy life',
    description: 'till the end',
    due_date: '2020-12-13'
  },
  {
    title: 'Shopping',
    description: 'Buy -14 egs',
    due_date: Date.today.to_s
  },
  {
    title: '42',
    description: 'Answer to the Ultimate Question of Life, the Universe, and Everything',
    due_date: '9999-12-31'
  }
]

todo_seeds.each do |todo_seed|
  todo_repo.create(todo_seed)
end

get '/todos' do
  todos = todo_repo.all.map(&:to_hash).map do |todo|
    todo[:dueDate] = todo.delete(:due_date).to_s
    todo
  end

  json todos
end

post '/todos' do
  todo_json = request.body.read
  todo_params = JSON.parse(todo_json, symbolize_names: true)
  todo = todo_repo.create(todo_params)

  json todo
end
