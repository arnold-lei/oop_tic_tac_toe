# 2 Players draw a game board of 9 squares. 
# Players then choose one of the empty squares and place a marker 
# The player with 3 in a row wins

#Create a grid with empty spaces that can be filled
#Assign user to X and computer to O
#Get Xs from the user and have them place them at some EMPTY point in the grid
#Have the Os randomly generate from the computer and goes on and empty point in the grid
#Wash, rinse, repeat (loop) UNTIL...
#If 3 xs or 3 os are in a row, then one of the players wins or all squares are taken (tie)
#If there's a winner, show the winner / else state it's a tie

#loop until a winner or all squares are taken
  #player1 picks an empty square
  #check for a winner – this is variable
  #player2 picks an empty square
  #check for a winner

#if there's a winner
  #show the winner
#or else
  #it's a tie

#puts "Welcome to tic tac toe, would you like to be X or O? Pick one (X/O)"
require 'pry'

class Board
	WINNING_LINES = [[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7],[1,2,3],[4,5,6],[7,8,9]]

	def initialize
		@position = {}
		(1..9).each {|space| @position[space] = Square.new(' ')}
	#note to self when you initialize a Square you it requires a value and that value is ' ' 
	end
	
	def empty_squares
		@position.select {|position, square| square.to_s == ' '}.values	
	end
	
	def empty_positions
		@position.select {|_, square| square.empty?}.keys
	end
	
	def no_free
		empty_squares.length == 0
	end
	
	def draw
		system 'clear'
		puts "This is the game board:"
	

    puts " #{@position[1]}  |  #{@position[2]}  | #{@position[3]} "
    puts "- - + - - + - - "
    puts " #{@position[4]}  |  #{@position[5]}  | #{@position[6]} "
    puts "- - + - - + - - "
    puts " #{@position[7]}  |  #{@position[8]}  | #{@position[9]} "
	end
	
	def mark(position, marker)
		@position[position] = marker
	end

	def winning_condition(markers)
		WINNING_LINES.each do |line|
			return true if @position[line[0]] == markers && @position[line[1]] == markers && @position[line[2]] == markers
			end
			 false 
			end


end

class Square
	attr_accessor :marker
	def initialize(marker)
		@marker = marker 
	end
	
	def occupied?
		@marker != ' '
	end

	def empty?
		@marker == ' '
	end

	def to_s
	 @marker
	end
end

class Player
	attr_accessor :name, :mark
	def initialize(name, mark)
		@name = name
		@mark = mark
	end
end

class Human < Player
	def initialize(name, mark)
		super
	end

	def pick(board)
		puts "Please pick between positions 1-9"
		choice = gets.chomp.to_i
		until board.empty_positions.include?(choice) do 
			puts "The position must be empty, please pick again from postions 1-9"
			choice = gets.chomp.to_i 	
		end
		board.mark(choice, @mark)		
	end
end

class Computer < Player 
	def initialize(name, mark)
		super
	end

	def pick(board)
		choice = board.empty_positions.sample
		board.mark(choice, @mark)
	end
end

class Game
	attr_accessor :board, :human, :computer
	def initialize 
		@board = Board.new
		@human = Human.new("Arnold", "X")
		@computer = Computer.new("Hal 9000", "O")
	end
	def intro
		puts "Welcome to Tic Tac Toe"
	end

	def current_player
		if @current_player == @human
			@current_player = @computer
		else
			@current_player = @human
		end
	end

	def win?
		@board.winning_condition(@current_player.mark)
	end

	def play
		intro 
		@board.draw
		loop do 
			current_player.pick(@board)
			@board.draw
			if win?
				puts "#{@current_player.name} has won!"
				break
			elsif @board.no_free
				puts "it's a tie"
				break
			else 
			 @board.draw
			end
		end
	end
end


game = Game.new.play
