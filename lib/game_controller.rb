# game_controller.rb
# frozen_string_literal: true

require_relative 'board'
require_relative 'word'

# This class controls the game logic and flow.
class GameController
  def initialize
    @word = Word.new.word
    @board = Board.new(@word)
  end

  def play
    until game_over?
      puts "TEST: Word is #{@word}"
      check_guess
      @board.display
    end
    puts "Game over. The word was: #{@word}"
  end

  private

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
      unless @board.guessed_letters.include?(guess)
        @board.guessed_letters << guess
        # puts @board.guessed_letters
      end
    else
      @board.tries_left -= 1
    end
  end

  def game_over?
    @board.tries_left.zero? || @board.win
  end
end
