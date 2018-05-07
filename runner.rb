require './lib/mastermind'
# user interaction goes here

def initial
  puts "Welcome to MASTERMIND!\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit? >"
  initial_input = gets.chomp.upcase

  if initial_input == "Q" || initial_input == "QUIT"
    puts "Pssh fine, why even open the game just to quit?  Whatever."
    return

  elsif initial_input == "I" || initial_input == "INSTRUCTIONS"
    # instructions
    puts "You have to guess a random sequence containing only (r)ed, (g)reen, (b)lue, and (y)ellow.\nYou'll get feedback about how many correct elements you've guessed, and how many are in the correct position."
    initial
  elsif initial_input == "P" || initial_input == "PLAY"
    # play the game
    game_flow
  end
end

def game_flow
  mastermind = Mastermind.new
  puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  loop do 
    answer_input = gets.chomp.upcase
    puts mastermind.compare(answer_input)
    if answer_input == "Q"
      puts "Thanks for playing!"
      return
    elsif answer_input == mastermind.secret
      puts "\n\nDo you want to (p)lay again or (q)uit?"
      endgame_input = gets.chomp.upcase
      if endgame_input == "Q"
        puts "Thanks for playing!"
        break
      elsif endgame_input == "P"
        puts "Great! starting a new game now."
        initial
      end
    end
  end
end 

initial



