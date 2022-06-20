require_relative 'display'
require_relative 'logic'
require_relative 'computer'


class Player
  include Logic
  @@game_arr = [1, 2, 3, 4, 5, 6]

  def initialize
    @round_arr = [@@game_arr.sample, @@game_arr.sample, @@game_arr.sample, @@game_arr.sample]
    @guesses = 1
    @guess_arr = []
    @winner = nil
  end

  def player_guess
    puts "\nTurn #{@guesses}: Type your four numbers guess to guess a code, or 'q' to quit the game"
    @guess_arr = gets.chomp.split('')
    if @guess_arr.length == 4 
      @guess_arr.map! do |element|
        if element == 'q'
          @guesses = 12
        elsif element.to_i.between?(1, 6)
          element.to_i
        elsif element == 'c'
          p @round_arr
        else
          puts 'please enter a number between 1 and 6'
          turn
        end
      end
    else
      puts "Please enter a four numbers guess consiting of a number between 1 and 6"
      player_guess
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
    until @guesses > 12 || !@winner.nil?
      turn
      if @guesses > 12 && @winner.nil?
        puts "Sadly, you couldn't break the code which was"
        color(@round_arr)
        puts "\n"
      end
    end
  end

  def code_maker
    puts 'Enter a 4 digit code for the computer to guess'
    @round_arr = gets.chomp.split('').map! do |element|
      if element.to_i.between?(1, 6)
        element.to_i
      else
        puts 'please enter a number between 1 and 6'
        code_maker
      end
    end
    color(@round_arr)
    print "code \n"
    Computer.new(@round_arr)
  end
end
