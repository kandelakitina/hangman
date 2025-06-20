# board.rb
# frozen_string_literal: true

require_relative 'game_controller'
require_relative 'hangman_stages'

# Represents the game board
class Board

  def display(masked_word, tries_left)
    puts "Word: #{masked_word}"
    puts "Tries left: #{tries_left}"
    puts HANGMAN_STAGES[6 - tries_left]
  end

end
