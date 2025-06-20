# board.rb
# frozen_string_literal: true

require_relative 'game_controller'
require_relative 'hangman_art'

# Represents the game board
class Board
  def display(masked_word, tries_left)
    puts HangmanArt::STAGES[GameController::MAX_TRIES - tries_left]
    puts "Word: #{masked_word}"
    puts "Tries left: #{tries_left}"
  end
end
