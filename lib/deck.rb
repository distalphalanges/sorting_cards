class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    cards.count
  end

  def sort
    sorted = []
    cards.each do |unsorted_card|
      place = sorted.rindex { |sorted_card| sorted_card < unsorted_card } || -1
      sorted.insert(place + 1, unsorted_card)
    end
    sorted
  end
end
