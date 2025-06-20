# frozen_string_literal: true

require 'colorize'

HANGMAN_STAGES = [
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
