require "minitest/autorun"
require "minitest/pride"
require "./lib/mastermind"

# tests below

class MastermindTest < Minitest::Test

  # def make_guess(secret, guess)
  #   mastermind = Mastermind.new(secret)
  #   assert_equal(make_guess("AAAA", "BBBBB"), "string")
  # end

  def test_correct_compare

    mastermind = Mastermind.new('GGGG')
    valid = mastermind.compare('GGGG')

    assert_equal "Congratulations!  You got it in 1 guesses!", valid
  end

  def test_invalid_compare

    mastermind = Mastermind.new
    invalid = mastermind.compare('AAAA')
    number = mastermind.compare(1234)
    number_string = mastermind.compare("1234")
    
    assert_equal "Invalid input.  Please use RGBY.  Guess again:", invalid
    assert_equal "Invalid input.  Please use RGBY.  Guess again:", number
    assert_equal "Invalid input.  Please use RGBY.  Guess again:", number_string
  end

  def test_incorrect_compare

    mastermind = Mastermind.new('GBGB')
    incorrect_all = mastermind.compare('YYYY')
    correct_two = mastermind.compare('GBYY')
    correct_three = mastermind.compare('GBGY')
    correct_two_out_of_place = mastermind.compare('BGYY')
    correct_two_2 = mastermind.compare('GBRG')
    too_many = mastermind.compare('GGGG')

    assert_equal "You guessed 0 correct colors, with 0 in the correct position.  Please guess again:", incorrect_all
    assert_equal "You guessed 2 correct colors, with 2 in the correct position.  Please guess again:", correct_two
    assert_equal "You guessed 2 correct colors, with 3 in the correct position.  Please guess again:", correct_three
    assert_equal "You guessed 2 correct colors, with 0 in the correct position.  Please guess again:", correct_two_out_of_place
    assert_equal "You guessed 2 correct colors, with 2 in the correct position.  Please guess again:", correct_two_2
    assert_equal "You guessed 1 correct colors, with 2 in the correct position.  Please guess again:", too_many

  end

  def test_incorrect_compare_2
    mastermind = Mastermind.new('RGGG')
    one = mastermind.compare('GRRR')

    assert_equal "You guessed 2 correct colors, with 0 in the correct position.  Please guess again:", one
  end

  def test_qc_compare

    mastermind = Mastermind.new

    assert_equal "The correct answer is #{mastermind.secret}", mastermind.compare('c')
    # todo:  test for q (how do you test exiting a program???)
  end

  def test_short_input_compare

    mastermind = Mastermind.new
    short = mastermind.compare("grb")

    assert_equal "Your guess was too short, you need to guess 4 colors.  Please guess again:", short
  end

  def test_long_input_compare

    mastermind = Mastermind.new
    long = mastermind.compare("GRBYG")

    assert_equal "Your guess was too long, you need to guess 4 colors.  Please guess again:", long

  end

  def test_nil_input
    mastermind = Mastermind.new
    assert_equal "Your guess was too short, you need to guess 4 colors.  Please guess again:", mastermind.compare(nil)
  end


end