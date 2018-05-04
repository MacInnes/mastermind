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
    color_match = 0
    position_match = 0
    @count += 1
    input = input.to_s.upcase

    if input == @secret
      "Congratulations!  You got it in #{@count} guesses!"
      # endgame
    elsif input == "Q"
      # quit the game

    elsif input == "C"
      "The correct answer was #{@secret}"
      # endgame

    elsif input.length < 4
      "Your guess was too short, you need to guess 4 colors.  Please guess again:"
      # loop input
    elsif input.length > 4
      "Your guess was too long, you need to guess 4 colors.  Please guess again:"
      # loop input
    elsif /[RBGY]/.match?(input)
      @choices.each_with_index do |letter, i|
        # use .count ? maybe
        color_match = @secret.chars & input.chars
        color_match = color_match.length
          return "You guessed #{color_match} correct colors, with #{position_match} in the correct position.  Please guess again:"      
      end
    else
      "Invalid input.  Please use RGBY.  Guess again:"
      # invalid input
    end

  end
end