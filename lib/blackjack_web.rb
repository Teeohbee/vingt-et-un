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
    redirect '/gamesetup' if params[:playername] == ""
    player_one = Player.new(params[:playername])
    player_two = Player.new("Dealer")
    @game = Game.create(player_one, player_two)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  post '/hit' do
    @game = Game.instance
    @game.player_one.hit(@game.deck)
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
