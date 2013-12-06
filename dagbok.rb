#require 'sinatra'
#require 'slim'

class Dagbok < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.get(session[:user].to_i)
    p @user
    if session[:order]

    else
      @posts = Post.all(:user => @user)
    end

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

  get '/loginfail' do
    slim :loginfail
  end

  post '/logout' do
    session.destroy
    redirect '/'
  end
  post '/create' do
    title = params['title']
    text = params['text']
    user = User.get(session[:user].to_i)
    Post.create(title: title, text: text, user: user)
    redirect '/'
  end

  post '/search' do
    session[:order] = 1
    redirect '/'
  end


end

