require 'rubygems'
require 'sinatra'
require_relative 'tictactoe.rb'
enable :sessions

get '/' do
	session.clear
	erb :welcome
end

get '/game' do
	@game = Game.new
	session['game'] = @game
	erb :game
end

post '/game/turn' do
	@game = session[:game]
	@game.place_token(params[:grid_position])
	@game.check_for_win

    erb :game
end