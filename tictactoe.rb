
class Game 
	attr_accessor :board, :turn, :win
	#TODO - Have initialize with board size
	def initialize(opts={})
		@board = opts[:board] || [[1,2,3],[4,5,6],[7,8,9]]
		@player1 = "x"
		@player2 = "o"
		@win = 	opts[:win]  || false		
		@turn = opts[:turn] || 0
	end


	#Players turn is dependant on the turn counter above
	#A position, the number of the spot, is entered
	#place_token method is called to place that players token in the desired spot
	#Then check_for_win is called to check 
	def take_turn(position)
	    if @turn.even?
	    	place_token(@player2, position)
		else
			place_token(@player1, position)
		end
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
 
	def check_for_win #Add a Check for Tie
		if check_rows(@board) == true
			@win = true
		elsif check_columns == true
			@win = true
		elsif check_first_diagonal == true
			@win = true
		elsif check_second_diagonal == true
			@win = true
		elsif @turn == 9
			@win = "tie"
		else 
			@win = false
		end
	end


	#Used to check gameboard rows, also is called by check_columns & check_diagonals
	#It takes each row of board and first checks for an integer, if there are none it 
	#checks to see if all the elements of the row are unique, if so, there is a win/true is returned
	def check_rows(board)
		board.each do |n|
			unless n.include?(Fixnum)
				if n.uniq.length == 1
					return true
				else
					false
				end
			end
		end
	end


	def check_columns
		columns = []
		num = @board.count - 1

		while num >= 0
			@new_row = @board.map {|row| row[num]}
			columns << @new_row
			num -= 1
		end
		check_rows(columns)
	end

	def check_first_diagonal
		num = @board.count - 1 
		diagonal1 = []
		diagonal1 << (0..num).collect { |i| @board[i][i] } 
		check_rows(diagonal1)
	end

		#Top right to bottom left diagonal (diagonal2) still being 
		#worked on to accomodate custom board sizes
	def check_second_diagonal
		num = @board.count - 1 
		diagonal2 =[]
		diagonal2 << [@board[0][2], @board[1][1], @board[2][0]]
		check_rows(diagonal2)
	end

end


