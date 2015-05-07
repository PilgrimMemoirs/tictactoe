require 'rubygems'
require 'sinatra'
require_relative 'tictactoe.rb'


get '/' do
	erb :welcome
end

get '/game' do
	@game = Game.new
	erb :game
end

post '/game/turn' do
	@game = Game.new(session['game'])
end