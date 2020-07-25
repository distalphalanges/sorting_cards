require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test
  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_instance_of Deck, deck
  end

  def test_it_has_cards
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_equal cards, deck.cards
  end

  def test_it_can_count_cards
    # skip
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    assert_equal 3, deck.count
  end

end
