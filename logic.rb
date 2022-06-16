require 'pry-byebug'
require_relative 'display'

class Logic
  include Display
  @@game_arr = [1, 2, 3, 4, 5, 6]

  def initialize
    @round_arr = [@@game_arr.sample, @@game_arr.sample, @@game_arr.sample, @@game_arr.sample]
    @guesses = 1
    @guess_arr = []
    @winner = nil
  end

  def correct_position_numbers(cloned_arr)
    correct_position_indicator = 0
    @guess_arr.each_with_index do |guess, i|
      next unless guess == cloned_arr[i]

      correct_position_indicator += 1
      cloned_arr[i] = 'position'
      @guess_arr[i] = 'marked'
    end
    correct_numbers(cloned_arr, correct_position_indicator)
  end

  def correct_numbers(cloned_arr, correct_position_indicator)
    correct_indicator = 0
    @guess_arr.each_with_index do |guess, i|
      next unless cloned_arr.include?(guess)

      correct_indicator += 1
    end
    indicator(correct_position_indicator, correct_indicator) if correct_indicator > 0 || correct_position_indicator > 0
  end

  def round
    cloned_arr = @round_arr.clone
    correct_position_numbers(cloned_arr)
    @guesses += 1
  end

  def turn
    puts "\nTurn #{@guesses}: Type your four numbers guess to guess a code, or 'q' to quit the game"
    @guess_arr = gets.chomp.split('')
    if @guess_arr.length > 4
      puts "Maximum of 4 numbers are allowed in a guess"
      turn
    end
    @guess_arr.map! do |element|
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
    color(@guess_arr)
    win?
  end

  def win?
    if @round_arr == @guess_arr
      puts "\nYou guessed it right"
      @winner = true
    else
      round
    end
  end

  def game
    until @guesses >= 5 || !@winner.nil?
      turn
    end
    puts "\nYou lost solution is #{color(@round_arr)}" if @winner.nil?
  end
end
