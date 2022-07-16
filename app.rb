require 'sinatra'
require 'sinatra/reloader'

get '/learn-link-to' do
  erb :learn_link_to
end

def link_to(text, url)
  "<a href=#{url}>#{text}</a>"
end
