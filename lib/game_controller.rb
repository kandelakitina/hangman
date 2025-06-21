# game_controller.rb
# frozen_string_literal: true

require_relative 'board'
require_relative 'word'
require 'yaml'

# This class controls the game logic and flow.
class GameController
  MAX_TRIES = 6

  def initialize
    @word = Word.new.word
    @board = Board.new
    @tries_left = MAX_TRIES
    @guessed_letters = []
  end

  def start_game
    print 'Do you want to load the game? (y/n): '
    case gets.chomp.downcase
    when 'y' then load_game && play_game
    when 'n' then play_game
    else
      puts "Invalid input. Please enter 'y' or 'n'."
      start_game
    end
  end

  private

  def play_game
    until game_over?
      # Show for debugging only
      puts "TEST: Word is #{@word}"
      @board.display(masked_word, @tries_left)
      check_guess
    end
    puts win? ? 'You won!' : "You lost. The word was: '#{@word}'"
  end

  def masked_word
    @word.chars.map { |char| @guessed_letters.include?(char) ? char : '_' }.join(' ')
  end

  def ask_user_for_letter
    guess = ''
    until guess.match?(/^[a-zA-Z]$/) || guess == 'save'
      puts 'Enter a letter or type "save" to save the game:'
      guess = gets.chomp.downcase
    end
    guess
  end

  def check_guess
    guess = ask_user_for_letter
    if guess == 'save'
      save_game
    elsif @word.include?(guess)
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

  def save_game
    game_state = {
      word: @word,
      tries_left: @tries_left,
      guessed_letters: @guessed_letters
    }
    File.open('saved_game.yaml', 'w') do |file|
      file.write(game_state.to_yaml)
    end
    puts 'Game saved successfully.'
  end

  def load_game
    if File.exist?('saved_game.yaml')
      game_state = YAML.load_file('saved_game.yaml')
      @word = game_state[:word]
      @tries_left = game_state[:tries_left]
      @guessed_letters = game_state[:guessed_letters]
    else
      puts 'No saved game found. Starting a new game...'
    end
  end
end
