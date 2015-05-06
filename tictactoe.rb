class Game 
	def initialize
		@board = [[1,2,3],[4,5,6],[7,8,9]]
		@player1 = "x"
		@player2 = "o"
		# start_game
	end

	def print_board
		print @board
	end


	def take_turn(player, position)
	    if player == 1
		    @board.each do |n|
			    index = n.index(position)
				n[index] = "x" unless index.nil?
			end
		else
			@board.each do |n|
			    index = n.index(position)
				n[index] = "o" unless index.nil?
			end
		end
    end



	def check_for_win

		if check_rows(@board) == true
			print "You Win1!"
		elsif check_columns == true
			print "You Win2!"
		elsif check_diagonals == true
			print "You Wine!"
		else 
			print "Keep going!"
		end
	end

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
		rows = []
		num = @board.count - 1

		while num >= 0
			@new_row = @board.map {|row| row[num]}
			rows << @new_row
			num -= 1
		end
		check_rows(rows)
	end

	def check_diagonals
		false
	end

end

funtimes = Game.new

funtimes.take_turn(1, 1)
funtimes.take_turn(1, 4)
funtimes.take_turn(1, 8)

funtimes.print_board

funtimes.check_for_win




	# def check_columns
	# 	num = @board.count - 1
	# 	result = false


	# 		while num > -1
	# 			arr = []

	# 			@board.each do |n|
	# 				arr << n[num]
	# 			end

	# 			unless arr.include?(Fixnum) && arr.include("x" || "o")
	# 				if arr.uniq.length == 1
	# 					return true
	# 					break
	# 				else
	# 					return false
	# 			end
	# 		end
	# 		num -= 1
	# 	end
	# end