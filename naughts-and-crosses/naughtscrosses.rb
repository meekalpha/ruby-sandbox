class Game
	def initialize 
		@board = [[false,false,false],[false,false,false],[false,false,false]]
		@p1_turn = true
		@turns_count = 0
	end

	public
	def next_turn
		draw
		puts "It is #{whos_turn}'s turn."
		puts "#{whos_turn} plays: (row, column)"

		loop do
			x,y = gets.chomp.split(',').map { |x| x.to_i - 1 }
			break if play(x,y) 
		end 
	end 
	public
	def play_game
		until winner or tie
			next_turn
		end
		draw
		puts "#{winner} wins!" if winner
		puts "It's a tie" if tie
	end

	private
	def whos_turn
		return @p1_turn ? 'p1' : 'p2'
	end

	private
	def tie
		@turns_count == 9
	end

	private
	def winner
		possible_wins = []
		#rows
		@board.each do |row|
			possible_wins << row
		end
		#columns
		for i in 0..2 do
			possible_wins << @board.collect { |row| row[i] }
		end
		#diagonals
		possible_wins << (0..2).collect { |i| @board[i][i] }
		possible_wins << (0..2).collect { |i| @board[i][-i-1] }

		player_dict = {p1:"X",p2:"O"}
		player_dict.each do |player, symbol|
			win = possible_wins.any? do |possible_win|
				possible_win.all? { |e| e == symbol }
			end 
			return player if win
		end
		nil
	end

	private
	def play x, y
		return false unless x and y
		return false unless x.between?(0,2) and y.between?(0,2)
		return false if @board[x][y]
		@board[x][y] = @p1_turn ? "X" : "O"
		@p1_turn = !@p1_turn
		@turns_count += 1
		true
	end

	private
	def draw
		board_string = ""
		@board.each do |row|
			board_string << draw_row(row) << "\n"
		end
		puts board_string
	end

	private
	def draw_row row
		row_str = ""
		row.each do |e|
			row_str << (e ? "[#{e}]" : "[ ]")
		end
		row_str
	end
end

my_game = Game.new
my_game.play_game