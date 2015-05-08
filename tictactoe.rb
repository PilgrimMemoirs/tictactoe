
class Game 
	attr_accessor :board, :turn
	attr_reader :win

	def initialize(opts={})
		@board = opts[:board] || [[1,2,3],[4,5,6],[7,8,9]]
		@player1 = "X"
		@player2 = "0"
		@win = 	 false		
		@turn = opts[:turn] || 1
		@board_size  = @board.count - 1
	end

##### Taking a Turn #######
	def take_turn(position)
	  place_token(position)
		check_for_win
  end

  def place_token(position)
  	set_player_turn

    @board.each do |n|
	    index = n.index(position.to_i)
			n[index] = @player unless index.nil?
		end

		@turn += 1
	end

	def set_player_turn
		if @turn.even?
  		@player = @player2
  	else
  		@player = @player1
  	end
	end
 
##### Checking Board for a Win #######
	def check_for_win 

		if @turn == 10
			@win = "tie"
		else 
			check_rows(@board) 
			check_columns
			check_first_diagonal
			check_second_diagonal
		end
	end

	def game_won
		@win = true
	end

	def check_rows(board)
		board.each do |n|
			unless n.include?(Fixnum)
				if n.uniq.length == 1
					game_won
				else
					false
				end
			end
		end
	end

##### Checking all possible win combinations #######
	def check_columns
		columns = []
		num = @board_size

		while num >= 0
			@new_row = @board.map {|row| row[num]}
			columns << @new_row
			num -= 1
		end
		check_rows(columns)
	end

	def check_first_diagonal
		diagonal1 = []
		diagonal1 << (0..@board_size).collect { |i| @board[i][i] } 
		check_rows(diagonal1)
	end

		#Top right to bottom left diagonal (second diagonal) still being 
		#worked on to accomodate custom board sizes
	def check_second_diagonal
		diagonal2 =[]
		diagonal2 << [@board[0][2], @board[1][1], @board[2][0]]
		check_rows(diagonal2)
	end

end


