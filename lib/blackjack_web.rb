require 'sinatra/base'
require_relative 'game'

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
    @player_one = Player.new(session[:playername])
    @player_two = Player.new("Dealer")
    session[:game] = Game.new(@player_one, @player_two)
    erb :game
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
