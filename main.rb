require 'sinatra'
require 'sinatra/reloader'

get '/' do 
    @title = 'メモアプリ'
    @content = 'main content'
    erb :index
end

get '/new' do
  erb :new
end

get '/edit' do
  erb :edit
end
