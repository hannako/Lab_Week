require 'sinatra/base'

class AirBnB < Sinatra::Base
  get '/' do
    'Hello AirBnB!'
  end

  get '/spaces' do
    erb :list_space
  end

  get '/spaces/new' do
    erb :create_a_space
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
