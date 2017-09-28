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

  def winner
  end

end

puts "Welcome to a game of Tic Tac Toe!"
game = TicTacToe.new
