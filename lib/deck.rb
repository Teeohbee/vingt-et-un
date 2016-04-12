class Deck
  attr_reader :cards

  def initialize
    @cards = Deck.build_cards
  end

  def self.build_cards
    deck = []
    ranks = Card.ranks
    suits = Card.suits
    suits.each do |suit|
      ranks.size.times do |i|
        deck << Card.new( ranks[i], suit)
      end
    end
    deck = deck.shuffle
  end

end
