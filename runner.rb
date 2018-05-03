require './lib/mastermind'
# user interaction goes here

mastermind = Mastermind.new

puts "Welcome to MASTERMIND!/n/nWould you like to (p)lay, read the (i)nstructions, or (q)uit?
>"
initial_input = gets.chomp

if initial_input.upcase == "Q" || initial_input.upcase = "QUIT"
  puts "Pssh fine, you're not even good at this game.  Why open the game just to quit?  Whatever."
  # this duplicates the logic in mastermind.rb, fix one or the other
  break
elsif initial_input.upcase = "P" || initial_input = "PLAY"
  
elsif initial_input.upcase = "I" || initial_input = "INSTRUCTIONS"
  puts 
  
end

def game_flow
  loop do 
    # game flow
    
  end
end 