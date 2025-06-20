# Hangman

A simple command-line implementation of the classic game Hangman, written in Ruby as part of Odin Ruby course.

## Features

* Randomly selects a word from a customizable word list (`word_list.txt`)
* Interactive guessing with input validation
* Displays hangman art as you make mistakes (with colors!)
* Clear separation of game logic, board display, and word selection
* Easily extensible and beginner-friendly

## Project structure

.
├── flake.lock
├── flake.nix
├── Gemfile
├── Gemfile.lock
├── gemset.nix
├── lib
│   ├── board.rb
│   ├── game_controller.rb
│   ├── hangman_art.rb
│   ├── word_list.txt
│   └── word.rb
├── main.rb
└── word_list.txt

## Run on Nix

If you're on Nix use `nix develop` to load the Ruby environment and run `ruby main`.

## Run on Ruby

Otherwise, install Ruby and colorize gem with `gem install colorize` and run `ruby main`.
