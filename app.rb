require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
    #  bookmarks.join
  end
  # in app.rb

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end
  
  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    # ^^^ Refractered
    # url = params['url']
    # connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end




  get '/' do
    'Bookmark Manager'
  end

  run! if app_file == $0
end
