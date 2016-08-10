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
    @space = Space.all
    erb :'users/spaces'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/spaces/new' do
    erb :create_a_space
  end

  post '/spaces/temp' do
    space = Space.new(name: params[:name],
      description: params[:description],
      price: params[:price])
    space.save
    redirect '/users/spaces'
  end

  get "/spaces/:id" do
    space = Space.first(id: params[:id])
    @space_name = space.name
    @space_description = space.description
    @space_price = space.price
    erb :space
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
