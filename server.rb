require "sinatra"
require "csv"
require "pry"
require "erb"
require "capybara"
require_relative "models/grocery"

require "sinatra/reloader" if development?
require "pry" if development? || test?

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  redirect "/grocery-list"
end

get "/grocery-list" do
  @groceries = []
  CSV.foreach("grocery_list.csv", headers: true) do |row|
    @groceries << row
  end
  @groceries
  erb :grocery_list
end

post "/grocery-list" do
  item = params["name"]
  if item != ''
    CSV.open("grocery_list.csv", "a") do |csv|
      csv << [item]
    end
    redirect "/grocery-list"
  else
    @error = "Error: Please fill in all fields ya dingus!"
  end
end
