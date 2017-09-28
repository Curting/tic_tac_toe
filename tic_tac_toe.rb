class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @index = nil
    @input = nil
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def player
    @board.count(" ") % 2 == 0 ? "O" : "X"
  end

  def turn
    puts "Player #{player}: Enter a number between 1-9:"
    @input = gets.chomp

    # If the input is vaild (between 1-9) turn it to an index (input - 1)
    if valid_input?
      input_to_index

      # If the index is availiable, add the current player char to the board
      if index_avail?
        add_to_board(player)
      else
        puts "Index #{@input} is already taken by #{@board[@index]}. Please try again."
        turn
      end
    else
      puts "Your input '#{@input}' is not a number between 1-9. Please try again."
      turn
    end
  end

  def valid_input?
    @input.to_i.between?(1, 9) && @input.to_i.integer?
  end

  def index_avail?
    @board[@index] == " "
  end

  def input_to_index
    @index = @input.to_i - 1
  end

  def add_to_board(player)
    @board[@index] = player
  end

  def won?
    # Horizontal
    (@board[0] == @board[1] && @board[1] == @board[2] && @board[0] != " ") ||
    (@board[3] == @board[4] && @board[4] == @board[5] && @board[3] != " ") ||
    (@board[6] == @board[7] && @board[7] == @board[8] && @board[6] != " ") ||
    (@board[0] == @board[1] && @board[1] == @board[2] && @board[0] != " ") ||
    # Vertical
    (@board[0] == @board[3] && @board[3] == @board[6] && @board[0] != " ") ||
    (@board[1] == @board[4] && @board[4] == @board[7] && @board[1] != " ") ||
    (@board[2] == @board[5] && @board[5] == @board[8] && @board[2] != " ") ||
    # Diagonal
    (@board[0] == @board[4] && @board[4] == @board[8] && @board[0] != " ") ||
    (@board[2] == @board[4] && @board[4] == @board[6] && @board[2] != " ")
  end

  def draw?
    # If there's no empty indexes and no one has won
    !@board.include?(" ") && !won?
  end

  def game_over?
    won? || draw?
  end


  def winner # Refactor
    if
      # Horizontal
      (@board[0] == @board[1] && @board[1] == @board[2] && @board[0] == "X") ||
      (@board[3] == @board[4] && @board[4] == @board[5] && @board[3] == "X") ||
      (@board[6] == @board[7] && @board[7] == @board[8] && @board[6] == "X") ||
      (@board[0] == @board[1] && @board[1] == @board[2] && @board[0] == "X") ||
      # Vertical
      (@board[0] == @board[3] && @board[3] == @board[6] && @board[0] == "X") ||
      (@board[1] == @board[4] && @board[4] == @board[7] && @board[1] == "X") ||
      (@board[2] == @board[5] && @board[5] == @board[8] && @board[2] == "X") ||
      # Diagonal
      (@board[0] == @board[4] && @board[4] == @board[8] && @board[0] == "X") ||
      (@board[2] == @board[4] && @board[4] == @board[6] && @board[2] == "X")
      return "X"
    else
      "O"
    end
  end
end

def welcome_message
  puts "Welcome to a game of Tic Tac Toe!"
  puts " "
  puts "The game is turn based. Player 1 is X and Player 2 is O."
  puts " "
  puts "Player 1 starts by entering a number between 1-9, which equals to"
  puts "one of the 9 indexes on the board:"
  puts " "
  puts " 1 | 2 | 3 "
  puts "-----------"
  puts " 4 | 5 | 6 "
  puts "-----------"
  puts " 7 | 8 | 9 "
  puts " "
  puts "Good luck - and may the best player win!"
end

def new_game
  game = TicTacToe.new
  until game.game_over?
    game.turn
    game.display_board
  end

  if game.won?
    puts "Player #{game.winner} has won! Congrats!"
  elsif game.draw?
    puts "The game is a draw :-("
  else
    puts "game_over is triggered but won? and draw? is false. wtf?"
  end
end

welcome_message
new_game





