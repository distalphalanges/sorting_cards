class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    response == card.to_s
  end

  def feedback
    (correct?) ? "Correct!" : "Incorrect."
  end
end
