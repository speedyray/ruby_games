
# Create real blackjack cards using ruby product method 
# randomize/shufle cards
# deal cards - hand out cards to player and dealer
# show the hand out cards 
# Ask what player wants to do
# If player selects hit or stand, calculate cards total

# Define a method to print a welcome message using helper method
def loading_game
  print_message "Welcome to the exciting game of Blackjack!"
end

def print_message(msg)
  puts ": #{msg}"
end

# define a method asking player to enter a name
def get_player_name
  print_message "Please enter your name."
  puts
  player_name = gets.chomp
end

# define a method to output player name 
def display_player_name(player_name)
  print_message "Hello and Welcome, #{player_name}, let's go!"
end

# Define a method to initialize cards, suits on the deck using arrays and shufle cards
def shuffle_the_deck
  cards = [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]
  suits = [ "S", "H", "D", "C" ]

  deck = cards.product(suits) * 5
  deck.shuffle!
end

# Define a method to calculate totals
def calculate_total(hand)
  arr = hand.map { |card| card[0] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select { |card| card == "A" }.count.times do
    total -= 10 if total > 21
  end 

  total
end

# Define a method to check if someone hit a blackjack
def blackjack?(total)
  total == 21
end

# # Define a method to check if someone is busted
def busted?(total)
  total > 21
end

# Define a method printing messages to show if someone hit a blackjack or busted
def blackjack_or_lose(total)
  case 
  when blackjack?(total)
    
    print_message "Congratulations, it's a Blackjack hit!"
    
    sleep 1.3
  when busted?(total)
    
    print_message "Sorry, you lose!"
    
    sleep 1.3
  end
end

# Define a method to show player's turn
def player_plays(player_hand, my_total, deck)
 blackjack_or_lose(my_total)

  while my_total < 21
    print_message "Would you like to 1) hit or 2) stay?"
    hit_or_stay = gets.chomp

    if !['1', '2'].include?(hit_or_stay)
      print_message "ERROR. Please enter 1 or 2"
      next
    end

    if hit_or_stay == "2"
      print_message "You chose to stay."
      puts
      break
    end

    sleep 1.3
    system "clear"
    new_card = deck.pop
    
    print_message "You chose to hit and now have the #{new_card} card"
    
    player_hand << new_card
    my_total = calculate_total(player_hand)
    print_message "Your total is now #{my_total}"
    

    blackjack_or_lose(my_total)
  end

  my_total
end

# Define a method to show dealer's turn
def dealer_plays(dealer_hand, dealer_cards, deck)
  sleep 1.5
  system "clear"

 
  print_message "Dealer turns over his card which was face down #{dealer_hand[1]}"
  puts
  print_message "Dealer is now showing #{dealer_hand[0]} and #{dealer_hand[1]} for a total of #{dealer_cards}"
  puts
  blackjack_or_lose(dealer_cards)
  sleep 1.6

  while dealer_cards < 17
    new_card = deck.pop
   
    print_message "Dealer has the #{new_card}"
    puts
    dealer_hand << new_card
    dealer_cards = calculate_total(dealer_hand)
    print_message "Dealer total is now #{dealer_cards}"
    puts
    sleep 1.6

   blackjack_or_lose(dealer_cards)
  end

  dealer_cards
end

# Define a method to compare totals and display the appropriate message
def compute_winner(player_total, dealer_total, player_name)
  if player_total == dealer_total
    sleep 1.3
    system "clear"
    
   print_message "#{player_name}'s total is #{player_total}"
    puts
    print_message "The Dealer's total is #{dealer_total}"
    
    print_message "It's a tie."
    puts
  elsif player_total > dealer_total
    sleep 1.3
    system "clear"
   
    print_message "#{player_name}'s total is #{player_total}"
    puts
    print_message "The Dealer's total is #{dealer_total}"
    
    print_message "You win, #{player_name}!"
    puts
  elsif player_total < dealer_total
    sleep 1.3
    system "clear"
    
    print_message "#{player_name}'s total is #{player_total}"
    puts
    print_message "The Dealer's total is #{dealer_total}"
    
    print_message "You lose, #{player_name}"
    puts
  end unless dealer_total > 21
end

# Define a method to run the blackjack game
def run_blackjack_game(player_name)
  deck = shuffle_the_deck

  loop do
    player_hand = []
    dealer_hand = []

    player_hand << deck.pop
    dealer_hand << deck.pop
    player_hand << deck.pop

    dealer_hand << deck.pop

    my_total = calculate_total(player_hand)
    dealer_cards = calculate_total(dealer_hand)


    sleep 1.3
    system "clear"
    
    print_message "Dealer is dealing Cards now..."
    puts
    print_message "Player has these cards #{player_hand[0]} and #{player_hand[1]} for a total of #{my_total}"
    puts
    print_message "The dealer's cards are #{dealer_hand[0]}"
    puts 

    player_total = player_plays(player_hand, my_total, deck)

    if player_total <= 21
      dealer_total = dealer_plays(dealer_hand, dealer_cards, deck)
      
      compute_winner(player_total, dealer_total, player_name)
    end

    print_message "Would you like to play another game? (y/n)"
    play_again = gets.chomp
    if play_again.downcase != "y" 
      break
    else
      next
    end

  end 
end


# Load blackjack game by printing welcome message
loading_game
# Request player to enter name and save into variable
player_name = get_player_name
# Print out welcome message using player name
display_player_name(player_name)
# Run the blackjack game
run_blackjack_game(player_name)