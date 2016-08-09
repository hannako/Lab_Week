require 'sinatra/base'

class AirBnB < Sinatra::Base

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post "/session/new" do
    redirect '/users/spaces'
  end

  get "/users/spaces" do
    erb :'users/spaces'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
