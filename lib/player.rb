class Player
attr_reader :name, :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def calculate_score
    sum = 0
    @hand.each do |card|
      sum += card.value
    end
    sum
  end

  def hit(deck)
    @hand << deck.cards.shift
  end

end
