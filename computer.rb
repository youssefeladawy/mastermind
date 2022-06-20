require_relative 'display'
require_relative 'logic'
require 'pry-byebug'

class Computer
  include Logic
  @@game_arr = [1, 2, 3, 4, 5, 6]

  def initialize(round_arr)
    @round_arr = round_arr
    @guesses = 1
    @guess_arr = [1, 1, 2, 2]
    @winner = nil
    @guess_set = @@game_arr.repeated_permutation(4).to_a
    game
  end

  def silence_output
    # Store the original stderr and stdout in order to restore them later
    @original_stderr = $stderr
    @original_stdout = $stdout
    # Redirect stderr and stdout
    $stderr = File.new(File.join(File.dirname(__FILE__), 'computer_guess.txt'), 'w')
    $stdout = File.new(File.join(File.dirname(__FILE__), 'computer_guess.txt'), 'w')
  end

  def enable_output
    $stderr = @original_stderr
    $stdout = @original_stdout
    @original_stderr = nil
    @original_stdout = nil
  end

  def computer_guess(guess_arr)
    matches = round(guess_arr, @round_arr)
    p "matches #{matches}"
    @guess_set.each do |guess|
      guess_arr_as_code = round(guess, guess_arr)
      p "guess_arr_as_code #{guess_arr_as_code}"
      @guess_set.delete(guess) unless matches[0] == guess_arr_as_code[0] && matches[1] == guess_arr_as_code[1]
    end
    @guess_arr = @guess_set[0]
  end

  def turn
    puts "\nTurn #{@guesses}: Computer is typing its guess"
    silence_output
    computer_guess(@guess_arr)
    enable_output
    color(@guess_arr)
    if win?(@guess_arr, @round_arr)
      puts "\nComputer guessed it right"
      @winner = true
    else
      round(@guess_arr, @round_arr)
    end
    @guesses += 1
  end

  def game
    until @guesses > 12 || !@winner.nil?
      turn
      puts "\nComputer couldn't break your code" if @guesses > 12 && @winner.nil?
      sleep(1.2)
    end
  end
end
