require 'sinatra'

get '/' do
	erb :welcome
end

get '/game' do
	erb :game
end