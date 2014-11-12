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
	def draw
		system 'clear'
		puts "This is the game board:"
	

    puts "#{@position[1].marker}   |#{@position[2].marker}    |#{@position[3].marker} "
    puts "- - + - - + - - "
    puts "#{@position[4].marker}   |#{@position[5].marker}    |#{@position[6].marker} "
    puts "- - + - - + - - "
    puts "#{@position[7].marker}   |#{@position[8].marker}    |#{@position[9].marker} "
	end
	def mark(position, marker)
		@position[position] = marker
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
	def pick 
		puts "#{name} have picked this space"
	end
end

class Computer < Player 
	def initialize(name, mark)
		super
	end
	def pick 
		puts "#{name}has picked this space"
		pick = Board::empty_squares
		@board.mark(pick, mark)
	end
end

class Game
	def initialize 
		@board = Board.new
		@human = Human.new("Arnold", "X")
		@computer = Computer.new("Hal 9000", "O")
	end
	def intro
		puts "Welcome to Tic Tac Toe"
	end
	def play
		intro 
		@board.draw
		@human.pick
		@computer.pick
	end
end


game = Game.new.play
