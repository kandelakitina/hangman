# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'word'

# This class controls the game logic and flow.
class GameController
  def initialize
    @board = Board.new
    @player = Player.new
    @word = Word.new
  end

  def play
    @board.display until game_over?
    @board.display
    if @board.win
      puts 'You won!'
    else
      puts "You lost. The word is #{word}"
    end
  end

  private

  def game_over?
    @board.win || @board.full
  end
end
