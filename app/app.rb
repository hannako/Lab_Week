ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class AirBnB < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, "Harry's Mum"

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/users/sign-in' do
    erb :'users/sign-in'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/users/spaces'
    else
      flash.now[:error] = 'Your login details are incorrect'
      erb :'users/sign-in'
    end
  end


  post "/users/new" do
    user = User.create(username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/users/spaces'
    else
      erb :'/users/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect '/'
  end

  get "/users/spaces" do
    erb :'users/spaces'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
