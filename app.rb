require "sinatra"
require "sinatra/activerecord"
require "./models/content"

get "/" do
  content = Content.find_by(name: "front_page")
  @front_page = content ? content.body : "Hello Ohio"
  erb :index
end
