require 'sinatra/base'

class AirBnB < Sinatra::Base
  get '/' do
    'Hello AirBnB!'
  end

  get '/spaces' do
    erb :list_spaces
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
