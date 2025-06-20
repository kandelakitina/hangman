# board.rb
# frozen_string_literal: true

require_relative 'game_controller'
require_relative 'hangman_stages'

# Represents the game board
class Board
  attr_accessor :tries_left, :guessed_letters

  def initialize(word)
    @word = word
    @guessed_letters = []
  end

  def display(tries_left)
    puts "Word: #{masked_word}"
    # puts "Guessed letters: #{@guessed_letters}"
    puts "Tries left: #{tries_left}"
    puts HANGMAN_STAGES[6 - tries_left]
  end

  def win
    if @word.chars.all? { |char| @guessed_letters.include?(char) }
      puts 'You won!'
      true
    else
      false
    end
  end

  private

  def masked_word
    @word.chars.map { |char| @guessed_letters.include?(char) ? char : '_' }.join(' ')
  end
end
