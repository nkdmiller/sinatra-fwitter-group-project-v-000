require './config/environment'

class ApplicationController < Sinatra::Base
	require_all 'app'
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
		enable :sessions
		set :session_secret, "fwitter"
  end
  get '/' do
		erb :index
	end
end
