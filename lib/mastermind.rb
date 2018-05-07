# game logic goes here
require 'pry'

class Mastermind
  attr_reader :secret

  def initialize(secret=nil, num=4)
    @num = num
    @choices = ["R", "G", "B", "Y"]

    @secret = secret || random_secret(num)
    @count = 0
    @start_time = Time.new
    @end_time = 0
    
  end



  def random_secret(num)
    num.times.map { @choices.sample }.join
  end

  def format_win(time)
    @end_time = Time.new
    total_time = @end_time - time
    hours = (total_time / 60 / 60).to_i
    minutes = (total_time / 60).to_i
    seconds = (total_time - (minutes * 60) - (hours * 60 * 60)).to_i
    output = ""
    if hours > 0
      output = "Congratulations!  You got it in #{@count} guesses over #{hours} hours, #{minutes} minutes, and #{seconds} seconds."
    elsif minutes > 0
      output = "Congratulations!  You got it in #{@count} guesses over #{minutes} minutes, and #{seconds} seconds."
    else
      output = "Congratulations!  You got it in #{@count} guesses over #{seconds} seconds."
    end
  end

  def compare(input)

    position_match = 0
    element_match = 0
    
    input = input.to_s.upcase
    temp = @secret.clone

    if input == @secret
      @count += 1
      format_win(@start_time)

    elsif input == "C"
      "The correct answer is #{@secret}"

    elsif input.length < @num
      "Your guess was too short, you need to guess #{@num} elements.  Please guess again:"

    elsif input.length > @num
      "Your guess was too long, you need to guess #{@num} elements.  Please guess again:"

    elsif /^[RBGY]+$/.match?(input)
      @count += 1
      position_match = input.each_char.with_index.count {|char, i| char == @secret[i] }
      input.chars.each do |each|
        if temp.include? each
          i = temp.index each
          temp[i] = ""
          element_match += 1
        end
      end
      "You guessed #{element_match} correct elements, with #{position_match} in the correct position.  Please guess again:"      
    else
      "Invalid input.  Please use RGBY.  Guess again:"
    end
  end
end