# game_controller.rb
# frozen_string_literal: true

require_relative 'board'
require_relative 'word'

# This class controls the game logic and flow.
class GameController
  MAX_TRIES = 6

  def initialize
    @word = Word.new.word
    @board = Board.new
    @tries_left = MAX_TRIES
    @guessed_letters = []
  end

  def play
    until game_over?
      # Show for debugging only
      puts "TEST: Word is #{@word}"
      check_guess
      @board.display(masked_word, @tries_left)
    end
    puts win? ? 'You won!' : "You lost. The word was: '#{@word}'"
  end

  private

  def masked_word
    @word.chars.map { |char| @guessed_letters.include?(char) ? char : '_' }.join(' ')
  end

  def ask_user_for_letter
    guess = ''
    until guess.match?(/^[a-zA-Z]$/)
      puts 'Enter a letter:'
      guess = gets.chomp.downcase
    end
    guess
  end

  def check_guess
    guess = ask_user_for_letter
    if @word.include?(guess)
      @guessed_letters << guess unless @guessed_letters.include?(guess)
    else
      @tries_left -= 1
    end
  end

  def game_over?
    @tries_left.zero? || win?
  end

  def win?
    @word.chars.all? { |char| @guessed_letters.include?(char) }
  end
end
