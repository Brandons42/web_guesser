require 'sinatra'
require 'sinatra/reloader'
random = rand(0..100)
get '/' do
  "THE SECRET NUMBER IS #{random}"
end
