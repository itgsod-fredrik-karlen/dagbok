#require 'sinatra'
#require 'slim'

class Dagbok < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.get(session[:user])
    @posts = Post.all
    slim :index
  end

  get '/post/:id' do |id|
    @post = Post.get(id.to_i)
    slim :post
  end


  post '/login' do
    user = User.first(username: params['username'])
    if user && user.password == params['password']
      session[:user] = user.id
      redirect '/'
    else
      redirect '/loginfail'
    end


  end

end

