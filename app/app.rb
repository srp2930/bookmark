require 'sinatra/base'
require_relative './lib/link'

class BookmarkManager < Sinatra::Base
  get '/' do
  	"hello world"
  end

  get '/links' do
  	@links = Link.all
  	erb :'links/index'
  end

  run! if app_file == $0
end