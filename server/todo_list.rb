require 'sinatra'
require 'sinatra/json'

get '/todos' do
  todos = [
    {
      id: 1,
      title: '42',
      description: 'caramba',
      due_date: Date.today
    }
  ]

  json todos
end
