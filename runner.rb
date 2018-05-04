require './lib/mastermind'
# user interaction goes here



def game_flow
  mastermind = Mastermind.new
  puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  loop do 
    answer_input = gets.chomp
    puts mastermind.compare(answer_input)

  end
end 

puts "Welcome to MASTERMIND!/n/nWould you like to (p)lay, read the (i)nstructions, or (q)uit?
>"
initial_input = gets.chomp

if initial_input.upcase == "Q" || initial_input.upcase == "QUIT"
  puts "Pssh fine, you're not even good at this game.  Why open the game just to quit?  Whatever."
  # this duplicates the logic in mastermind.rb, fix one or the other

elsif initial_input.upcase == "I" || initial_input.upcase == "INSTRUCTIONS"
  # instructions
  puts "Instructions"
elsif initial_input.upcase == "P" || initial_input.upcase == "PLAY"
  # play the game
  game_flow
end

