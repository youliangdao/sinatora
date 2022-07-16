require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
  "hello world!"
end

get '/learn-link-to' do
  erb :learn_link_to
end

get '/learn-layout' do
  erb :learn_layout
end

get '/users' do
  db = SQLite3::Database.new 'sample.db'
  rs = db.execute('select * from users;')
  @users_hash = rs.map do |row|
    {id: row[0], name: row[1]}
  end
  erb :'users/index'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  db = SQLite3::Database.new 'sample.db'
  sql = 'insert into users(name) values(?);'
  stmt = db.prepare(sql)
  stmt.bind_params(params[:name])
  stmt.execute

  redirect to('/users')
end

def link_to(text, url)
  "<a href=#{url}>#{text}</a>"
end
