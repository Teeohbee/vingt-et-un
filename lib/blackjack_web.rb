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
    @game = Game.create(player_one)
    redirect '/play'
  end

  get '/play' do
    @game = Game.instance
    erb :play
  end

  post '/hit' do
    @game = Game.instance
    @game.hit
    redirect '/play'
  end

  post '/stick' do
    @game = Game.instance
    @game.stick
    redirect '/play'
  end

  post '/dealer_play' do
    @game = Game.instance
    @game.dealer_play
    redirect '/play'
  end

  post '/new_game' do
    @game = Game.instance
    player_one = Player.new(@game.player_one.name)
    @game = Game.create(player_one)
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
