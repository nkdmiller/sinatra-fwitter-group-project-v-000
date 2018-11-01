class UsersController < ApplicationController

  get '/signup' do
    erb :'users/create_user', :layout => false
  end
  post "/users" do
    if User.find_by(username: params[:user][:username])
      @fail = true
      erb :'users/create_user', :layout => false
    else
      @create = true
      @user = User.create(:username => params[:user][:username], :password => params[:user][:password], :email => params[:user][:email])
      session[:user_id] = @user.id
      redirect to '/tweets'
    end
  end
  get '/logout' do
    session.clear
    redirect to '/'
  end
  #navbar and other layout not needed for login/signup forms
  get '/login' do
    erb :'users/login', :layout => false
  end
  post '/users/login' do
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect to '/tweets'
      else
        @fail = true
        erb :'/users/login', :layout => false
      end
  end
end
