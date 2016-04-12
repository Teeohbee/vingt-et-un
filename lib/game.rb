require_relative 'card'
require_relative 'player'
require_relative 'deck'
require 'byebug'

class Game

  attr_reader :deck, :player_one, :player_two

  def initialize(player_one, player_two)
    @deck = Deck.new
    @player_one = player_one
    @player_two = player_two
    2.times do
      @player_one.hit(@deck)
      @player_two.hit(@deck)
    end
  end

  def has_a_winner?
    if blackjack?(@player_one) || blackjack?(@player_two)
      "blackjack"
    elsif bust?(@player_one) || bust?(@player_two)
      "bust"
    end
  end

  def blackjack?(player)
    player.calculate_score == 21
  end

  def bust?(player)
    player.calculate_score > 21
  end

end
