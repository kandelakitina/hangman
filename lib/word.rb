# frozen_string_literal: true

# Represents a word picked from a list of words.
class Word
  def initialize
    @word = pick_word
  end

  private

  def pick_word
    words = File.readlines('word_list.txt').map(&:chomp)
    words.sample
  end
end
