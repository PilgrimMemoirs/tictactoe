require_relative('../tictactoe.rb') 

describe 'Playing Game' do

	it 'Changes marker on Board' do
			@game = Game.new
			@game.take_turn(1)
		expect(@game.board[0][0]).to eq('0')
	end

	it 'Tallies turns taken' do
		@game = Game.new
		@game.take_turn(1)
		@game.take_turn(2)
		@game.take_turn(3)
		expect(@game.turn).to eq(3)
	end

	it 'detects a win in a row' do
			@game = Game.new
			@game.take_turn(4)
			@game.take_turn(1)
			@game.take_turn(5)
			@game.take_turn(2)
			@game.take_turn(6)
		expect(@game.win).to eq(true)
	end

	it 'detects a win in a column' do
			@game = Game.new
			@game.take_turn(2)
			@game.take_turn(1)
			@game.take_turn(5)
			@game.take_turn(9)
			@game.take_turn(8)
		expect(@game.win).to be(true)
	end

	it 'detects a win in the first diagonal' do
			@game = Game.new
			@game.take_turn(1)
			@game.take_turn(2)
			@game.take_turn(5)
			@game.take_turn(8)
			@game.take_turn(9)
		expect(@game.win).to be(true)
	end

	it 'detects a win in the second diagonal' do
			@game = Game.new
			@game.take_turn(1)
			@game.take_turn(2)
			@game.take_turn(5)
			@game.take_turn(8)
			@game.take_turn(9)
		expect(@game.win).to be(true)
	end

	it 'detects a tie' do
			@game = Game.new
			@game.take_turn(1)
			@game.take_turn(2)
			@game.take_turn(3)
			@game.take_turn(5)
			@game.take_turn(4)
			@game.take_turn(7)
			@game.take_turn(6)
			@game.take_turn(9)
			@game.take_turn(8)
		expect(@game.win).to eq("tie")
	end
end

