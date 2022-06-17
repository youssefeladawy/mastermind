require_relative 'display'
require_relative 'logic'
require 'pry-byebug'


class Player
  include Logic
  @@game_arr = [1, 2, 3, 4, 5, 6]

  def initialize
    @round_arr = [@@game_arr.sample, @@game_arr.sample, @@game_arr.sample, @@game_arr.sample]
    @guesses = 1
    @guess_arr = []
    @winner = nil
    game
  end

  def player_guess
    puts "\nTurn #{@guesses}: Type your four numbers guess to guess a code, or 'q' to quit the game"
    @guess_arr = gets.chomp.split('').map! do |element|
      if element == 'q'
        @guesses = 12
      elsif element.to_i.between?(1, 6)
        element.to_i
      elsif element == 'c'
        p @round_arr
        turn
      else
        puts 'please enter a number between 1 and 6'
        turn
      end
    end
  end

  def turn
    player_guess
    color(@guess_arr)
    if win?(@guess_arr, @round_arr)
      puts "\nYou guessed it right"
      @winner = true
    else
      round(@guess_arr, @round_arr)
    end
    @guesses += 1
  end

  def game
    until @guesses >= 13 || !@winner.nil?
      turn
    end
  end
end
