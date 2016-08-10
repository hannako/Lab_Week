ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class AirBnB < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello AirBnB!'
  end

  get '/spaces' do
    @space = Space.all
    erb :list_space
  end

  get '/spaces/new' do
    erb :create_a_space
  end

  post '/spaces/temp' do
    space = Space.new(name: params[:name],
      description: params[:description],
      price: params[:price])
    space.save
    redirect '/spaces'
  end

  get "/spaces/:id" do
    space = Space.first(id: params[:id])
    @space_name = space.name
    @space_description = space.description
    @space_price = space.price
    erb :space
  end

  post 'spaces/confirm-date' do
    puts day_to_confirm = params[:date].split("/").join("") 
    redirect 'spaces/requests' if Day.where(date: day_to_confirm).nil?
  end

  get 'spaces/requests' do
    erb :requests
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
