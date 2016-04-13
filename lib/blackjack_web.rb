require 'sinatra/base'

class BlackjackWeb < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  get '/gamesetup' do
    erb :gamesetup
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
