require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  'adapter' => 'sqlite3',
  'database' => './memos.db'
)

use Rack::MethodOverride

class Memo < ActiveRecord::Base
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @memos = Memo.order('id desc').all
  erb :index
end

get '/new' do
  erb :new
end

post "/new" do 
    Memo.create(title: params['title'], body: params['body'])
    redirect '/'
    erb :new
end

get '/memos/:id/edit' do
  @memo = Memo.find(params['id'])
  erb :edit
end

patch '/memos/:id/edit' do
  @memo = Memo.find(params['id'])
  @memo.update(title: params['title'], body: params['body'])
  erb :show
end

get "/memos/:id" do
  @memo = Memo.find(params['id'])
  erb :show
end

delete '/memos/:id' do
  Memo.find(params['id']).destroy
  redirect '/'
end