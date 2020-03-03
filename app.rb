require "json"
require "sinatra"
require "sinatra/activerecord"
require "./models/content"

get "/" do
  content = Content.find_by(name: "front_page")
  @front_page = content ? content.body : "Hello Ohio"
  erb :index
end

# create content
post "/content" do
  content_type :json

  data = JSON.parse(request.body.read)
  
  content = Content.new(name: data["name"], body: data["body"])

  if !content.save
    status 500
    return {
      errors: content.errors.full_messages
    }.to_json
  end

  content.to_json
end

# view content
get "/content/:id" do
  content_type :json

  content = Content.find(params["id"])

  if !content
    status 404
    {
      errors: ["Not Found"]
    }.to_json
  end

  content.to_json
end

# list content
# update content
# delete content
