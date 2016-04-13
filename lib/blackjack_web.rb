require 'sinatra/base'

class BlackjackWeb < Sinatra::Base
  get '/' do
    'Hello BlackjackWeb!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
