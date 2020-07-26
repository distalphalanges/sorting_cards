require './lib/guess'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    deck.cards.first
  end

  def record_guess(guess_hash)
    guess_string = "#{guess_hash[:value]} of #{guess_hash[:suit]}"
    guess = Guess.new(guess_string, current_card)

    deck.cards.shift
    guesses << guess

    guess
  end

  def number_correct
    guesses.count { |guess| guess.correct? }
  end

  def percent_correct
    (number_correct.to_f / guesses.count.to_f).round(1) * 100
  end
end
