require_relative 'card'
require_relative 'player'
require_relative 'deck'
require 'byebug'

class Game

  attr_reader :deck, :player_one, :dealer, :current_player

  def initialize(player_one)
    @deck = Deck.new
    @player_one = player_one
    @dealer = Player.new("Dealer")
    2.times do
      @player_one.hit(@deck)
      @dealer.hit(@deck)
    end
    @current_player = @player_one
    @game_over = false
  end

  def self.create(player_1)
    @game = Game.new(player_1)
  end

  def self.instance
    @game
  end

  def stick
    @current_player = @dealer
    if @dealer.calculate_score >= 17
      @game_over = true
    end
  end

  def hit
    @current_player.hit(@deck)
  end

  def blackjack?(player)
    player.calculate_score == 21
  end

  def bust?(player)
    player.calculate_score > 21
  end

  def game_over?
    if @game_over == true
      true
    elsif blackjack?(@current_player)
      @game_over = true
    elsif bust?(@current_player)
      @game_over = true
    else
      false
    end
  end

  def winner
    if game_over?
      if blackjack?(@player_one) || bust?(@dealer)
        @player_one
      elsif blackjack?(@dealer) || bust?(@player_one)
        @dealer
      elsif @player_one.calculate_score > @dealer.calculate_score
        @player_one
      else
        @dealer
      end
    end
  end

  def dealer_play
    if @dealer.calculate_score < 17
      hit
      if @dealer.calculate_score >= 17
        @game_over = true
      end
    else
      @game_over = true
    end
  end

end
