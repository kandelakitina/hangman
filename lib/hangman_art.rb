# hangman_stages.rb
# frozen_string_literal: true

require 'colorize'

module HangmanArt
  STAGES = [
    "
       ----
       |  |
       |
       |
       |
       |
      ----
  ".colorize(:blue),
    "
       ----
       |  |
       |  O
       |
       |
       |
      ----
  ".colorize(:green),
    "
       ----
       |  |
       |  O
       |  |
       |
       |
      ----
  ".colorize(:yellow),
    "
       ----
       |  |
       |  O
       | /|
       |
       |
      ----
  ".colorize(:magenta),
    "
       ----
       |  |
       |  O
       | /|\\
       |
       |
      ----
  ".colorize(:red),
    "
       ----
       |  |
       |  O
       | /|\\
       | /
       |
      ----
  ".colorize(:light_red),
    "
       ----
       |  |
       |  O
       | /|\\
       | / \\
       |
      ----
  ".colorize(:light_black)
  ].freeze
end
