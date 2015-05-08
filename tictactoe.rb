
class Game 
	attr_accessor :board, :turn
	attr_reader :win

	def initialize(opts={})
		@board = opts[:board] || [[1,2,3],[4,5,6],[7,8,9]]
		@player1 = "X"
		@player2 = "0"
		@win = 	 false		
		@turn = opts[:turn] || 1
		@num  = @board.count - 1
	end


	#Players turn is dependant on the turn counter above
	#A position, the number of the spot, is entered
	#place_token method is called to place that players token in the desired spot
	#Then check_for_win is called to check 
	def take_turn(position)
	    place_token(position)
		check_for_win
    end

    #Add way to not override other players tokens
    def place_token(position)
    	if @turn.even?
    		player = @player2
    	else
    		player = @player1
    	end

	    @board.each do |n|
		    index = n.index(position.to_i)
			n[index] = player unless index.nil?
		end

		@turn += 1
	end
 
	def check_for_win #make case statement

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


	#Used to check gameboard rows, also is called by check_columns & check_diagonals
	#It takes each row of board and first checks for an integer, if there are none it 
	#checks to see if all the elements of the row are unique, if so, Game is Won
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


	def check_columns
		columns = []
		num = @num

		while num >= 0
			@new_row = @board.map {|row| row[num]}
			columns << @new_row
			num -= 1
		end
		check_rows(columns)
	end

	def check_first_diagonal
		diagonal1 = []
		diagonal1 << (0..@num).collect { |i| @board[i][i] } 
		check_rows(diagonal1)
	end

		#Top right to bottom left diagonal (diagonal2) still being 
		#worked on to accomodate custom board sizes
	def check_second_diagonal
		diagonal2 =[]
		diagonal2 << [@board[0][2], @board[1][1], @board[2][0]]
		check_rows(diagonal2)
	end

end


