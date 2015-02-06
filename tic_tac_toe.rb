# assign player to "X"
# assign computer to "O"
# Draw board
# player chooses if square available
# computer chooses if square available
# check for winner

require 'pry'

def welcome_message
  puts "Welcome to the AMAZING GAME of  TIC TAC TOE!"
end

def pre_process_board
  squares = {}
  (1..9).each {|position| squares[position] = ' ' }
  squares
end

def empty_positions(squares)
  squares.keys.select {|position| squares[position] == ' '}
end

def player_plays(squares)
  begin
  	 if empty_positions(squares).any?
    puts "Please choose an available square from: #{empty_positions(squares)}"
    position = gets.chomp.to_i
  end until empty_positions(squares).include?(position)
   sleep 0.5
   squares[position] = 'X'
     end
end

def computer_plays(squares)
  puts "Computer will now choose a square......"
  position = empty_positions(squares).sample
  sleep 0.5
  puts "Computer chose square #{position}"
  squares[position] = 'O'
end

def check_winner(squares)
  winning_combinations = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_combinations.each do |line|
    return "Player" if squares.values_at(*line).count('X') == 3
    return "Computer" if squares.values_at(*line).count('O') == 3
  end
  nil
end

def nine_positions_are_filled?(squares)
  empty_positions(squares) == []
end

def declare_winner(winner)
  puts "#{winner} won!"
end

def make_board(squares)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}"
  puts "     |     |"
  puts
end

begin
  welcome_message
  squares = pre_process_board
  make_board(squares)
begin
  player_plays(squares)
  computer_plays(squares)
  make_board(squares)
  winner = check_winner(squares)
end until winner || nine_positions_are_filled?(squares)
if winner
  declare_winner(winner)
else
  puts "It's a tie."
end
  puts "Want to play again? (y/n)"
  answer = gets.chomp.upcase
  system 'clear'
end while  answer =='Y'
