require 'sinatra/base'

class BlackjackWeb < Sinatra::Base
  enable :sessions

  set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/gamesetup' do
    erb :gamesetup
  end

  post '/gamesetup' do
    session[:playername] = params[:playername]
    redirect '/gamesetup' if session[:playername] == ""
    redirect '/game'
  end

  get '/game' do
    "Welcome Toby"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
