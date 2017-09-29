class TicTacToe
  @@results ||= { X: 0, O: 0, draw: 0 }

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @index = nil
    @input = nil
  end

  def display_board
    puts " "
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts " "
  end

  # Who is the current player?
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

  # Check if any matching combination is filled by the same value but a space " "
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

  def change_and_display_result
    if won?
      @@results[winner.to_sym] += 1
      puts "Player #{winner} has won! Congrats!"
    elsif draw?
      @@results[:draw] += 1
      puts "The game is a draw :-("
    end

    sleep(2)
    puts "... which makes the results:"
    sleep(1)
    puts " "
    puts "X: #{@@results[:X]} / O: #{@@results[:O]} / Draw(s): #{@@results[:draw]}"
    puts " "
  end

  private

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
end

# The methods beneath are to handle the TicTacToe class

def new_game
  game = TicTacToe.new
  until game.game_over?
    game.turn
    game.display_board
  end
  game.change_and_display_result
end

def play_again?
  puts "Do you want to play again? (Y/n)"
  answer = gets.chomp.downcase
  if answer == "y"
    play = true
  elsif answer == "n"
    puts "Alright. Bye bye!"
    play = false
  else
    puts "I didn't understand that. Let's try again:"
    play_again?
  end
end

def display_indexed_board
  puts " "
  puts " 1 | 2 | 3 "
  puts "-----------"
  puts " 4 | 5 | 6 "
  puts "-----------"
  puts " 7 | 8 | 9 "
  puts " "
end

def play
  display_indexed_board
  sleep(1)
  new_game
  play if play_again?
end

# Let the game begin
# All the sleep is for UX only

puts "Welcome to a game of Tic Tac Toe!"
sleep(2)
puts " "
sleep(1)
puts "The game is turn based. Player 1 is X and Player 2 is O."
sleep(3)
puts " "
sleep(1)
puts "Player 1 starts by entering a number between 1-9, which equals to"
sleep(2)
puts "one of the 9 indexes on the board."
sleep(2)
puts " "
sleep(1)
puts "Good luck - and may the best player win!"
sleep(2)
play






