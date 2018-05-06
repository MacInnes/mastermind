# game logic goes here
require 'pry'

class Mastermind
  attr_reader :secret
  def initialize(secret=nil)
    @choices = ["R", "G", "B", "Y"]
    @secret = secret || random_secret
    @count = 0
  end

  def random_secret
    4.times.map { @choices.sample }.join
  end

  def compare(input)
    position_match = 0
    @count += 1
    input = input.to_s.upcase
    color_match = (@secret.chars & input.chars).length

    # refactor this into:  return_value if condition
    
    if input == @secret
      "Congratulations!  You got it in #{@count} guesses!"
      # endgame
    elsif input == "Q"
      # quit the game

    elsif input == "C"
      "The correct answer is #{@secret}"
      # endgame

    elsif input.length < 4
      "Your guess was too short, you need to guess 4 colors.  Please guess again:"
      # loop input
    elsif input.length > 4
      "Your guess was too long, you need to guess 4 colors.  Please guess again:"
      # loop input
    elsif /[RBGY]/.match?(input)
      # input.chars.each_with_index do |char, i|
      #   position_match += 1 if char == @secret[i]
      # end
      position_match = input.each_char.with_index.count {|char, i| char == @secret[i] }
      "You guessed #{color_match} correct colors, with #{position_match} in the correct position.  Please guess again:"      
    else
      "Invalid input.  Please use RGBY.  Guess again:"
    end

  end
end