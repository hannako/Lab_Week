require 'sinatra/base'
require_relative 'data_mapper_setup'


class AirBnB < Sinatra::Base

  enable :sessions
  set :session_secret, "Harry's Mum"

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post "/users/new" do
    user = User.create(username: params[:username], email: params[:email], password: params[:password], confirm_password: params[:confirm_password])
    session[:user_id] = user.id
    redirect '/users/spaces'
  end

  get "/users/spaces" do
    erb :'users/spaces'
  end

  helpers do
    def current_user
      @current_user = User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
