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

  get '/space/:id' do
  space = Space.first(id: params[:id])

  erb :'links/index'
end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
