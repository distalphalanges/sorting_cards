class Card
  include Comparable
  attr_reader :value, :suit

  SUIT_VALUES = %w[Clubs Diamonds Hearts Spades]
  FACE_CARD_VALUES = { "Jack" => 11, "Queen" => 12, "King" => 13, "Ace" => 14 }

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{value} of #{suit}"
  end

  def <=>(other)
    [value_to_i, suit_to_i] <=> [other.value_to_i, other.suit_to_i]
  end

  def suit_to_i
    SUIT_VALUES.index(suit)
  end

  def value_to_i
    if value.match?(/\d/)
      value.to_i
    else
      FACE_CARD_VALUES[value]
    end
  end
end
