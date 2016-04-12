require 'game'

describe Deck do

  it "should build 52 cards" do
    expect(Deck.build_cards.length).to eql(52)
  end

  it "should have 52 cards when new deck" do
    expect(Deck.new.cards.length).to eql(52)
  end

end
