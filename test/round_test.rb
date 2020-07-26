require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_it_has_a_deck
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_it_has_a_current_card
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_it_starts_with_no_guesses
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_can_record_guesses
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)
    guess1 = round.record_guess({value: "3", suit: "Hearts"})

    assert_instance_of Guess, guess1
  end

  def test_current_card_changes_after_a_guess
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess({value: "3", suit: "Hearts"})

    assert_equal card_2, round.current_card
  end

  def test_it_can_check_guesses
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    guess1 = round.record_guess({value: "3", suit: "Hearts"})

    assert guess1.correct?

    guess2 = round.record_guess({value: "7", suit: "Spades"})

    refute guess2.correct?
  end

  def test_it_stores_previous_guesses
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    guess1 = round.record_guess({value: "3", suit: "Hearts"})
    guess2 = round.record_guess({value: "7", suit: "Spades"})

    assert_equal [guess1, guess2], round.guesses
  end

  def test_it_can_count_correct_guesses
    #skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess({value: "3", suit: "Hearts"})
    round.record_guess({value: "7", suit: "Spades"})

    assert_equal 1, round.number_correct
  end

  def test_it_can_calculate_percentage_correct
    #skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    round.record_guess({value: "3", suit: "Hearts"})
    round.record_guess({value: "7", suit: "Spades"})

    assert_equal 50.0, round.percent_correct
  end
end
