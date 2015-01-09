# Objective - Build a paper rock scissors game
# Game environment/Setting - There is always 2 players in the game, for example a player and a computer
# Playing the game - Each player picks either a paper, rock or scissors
# Winning the game - paper > rock > scissors > paper
#  Ask if user wants to play again





# There are only 3 choices, so create a constant and use an array or hash to hold them


#Create a hash to store game choices
CHOICES = {'p' =>"Paper", 'r'=> "Rock", 's'=> "Scissors"}

#Print a welcome message for game user
puts " Welcome to my exciting world of Paper, Rock, Scissors"

#Create two global variables to keep track and count of game outcomes
$user_wins_count = 0
$computer_wins_count = 0

#Define a method to print choice results
def print_winning_choices(winning_choices)

  if winning_choices == 'p' 

  puts "paper wraps the rock"

  elsif winning_choices =='r'
   
  
  puts "rock crashes scissors"
  

  elsif winning_choices =='s' 

  puts "scissors cuts paper"

  

  end

end





# Start main outer loop
loop do

  begin

  while true

  puts "Please pick one [r, p or s]"
   # Declare a variable to hold your selection
   user_picked = gets.chomp.downcase
  break if /^[rps]$/.match(user_picked)
  puts "Invalid entry, please try again."
  
  
  end
  puts "User picked: #{user_picked}"

  end until CHOICES.keys.include?(user_picked )


  computer_picked = CHOICES.keys.sample

  puts "Computer picked: #{computer_picked}"


  if user_picked  == computer_picked
   puts "It's a tie, No one won!"

  elsif (user_picked  == 'p' && computer_picked == 'r') || (user_picked  == 'r' && computer_picked == 's') || (user_picked  == 's' && computer_picked == 'p' )
  $user_wins_count += 1
 
  print_winning_choices(user_picked )

  puts "Congrats User, You won!!!"

  puts " User has won #{$user_wins_count} game(s) so far"
  puts " Computer has won #{$computer_wins_count} game(s) so far"

  else print_winning_choices(computer_picked)
  $computer_wins_count += 1

  puts "User lost, computer won"

  puts " Computer has won #{$computer_wins_count} game(s) so far"
  puts " User has won #{$user_wins_count} game(s) so far"
  end

  
  puts "You wanna go again?(y/n)"
  break if  gets.chomp.downcase != 'y'

  
end # End main outer loop

puts "Program Ends, Good Bye"