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

class Board
	def initialize
	@position = {}
	(1..9).each {|space| @position[space] = Square.new(' ')}
	#note to self when you initialize a Square you it requires a value and that value is ' ' 
	end
	def empty_squares
		@position.select {|position, square| square.marker == ' '}.values	
	end
	def no_free
		empty_squares.length == 0
	end
end

class Square
	attr_accessor :marker
	def initialize(marker)
		@marker = marker 
	end
end

class Game
	def initialize 
		@board = Board.new
	end
	def play
		p @board.empty_squares
	end
end
game = Game.new
game.play
