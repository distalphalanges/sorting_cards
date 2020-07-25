require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test
  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_it_has_a_card
    # skip
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal card, guess.card
  end

  def test_it_has_a_response
    # skip
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal "10 of Hearts", guess.response
  end

  def test_it_can_check_if_its_correct
    # skip
    card = Card.new("10", "Hearts")

    guess = Guess.new("10 of Hearts", card)
    assert guess.correct?

    guess = Guess.new("4 of Clubs", card)
    refute guess.correct?
  end

  def test_it_can_give_feedback
    # skip
    card = Card.new("10", "Hearts")

    guess = Guess.new("10 of Hearts", card)
    assert_equal "Correct!", guess.feedback

    guess = Guess.new("4 of Clubs", card)
    assert_equal "Incorrect.", guess.feedback
  end
end
