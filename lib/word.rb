# word.rb
# frozen_string_literal: true

# Represents a word picked from a list of words.
class Word
  attr_reader :word

  def initialize
    @word = pick_word
  end

  private

  def pick_word
    path = File.expand_path('../word_list.txt', __dir__)
    words = File.readlines(path)
                .map(&:chomp)
                .select { |word| word.length > 5 && word.length < 12 }
    words.sample
  end
end
