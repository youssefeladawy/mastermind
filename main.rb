require_relative 'display'
require_relative 'player'

class Mastermind
  include Display

  def play
    manual_script
    selection = gets.chomp.to_i
    if selection == 1
      puts "You're the Codemaker"
    elsif selection == 2
      puts "You're the Codebreakr"
      Player.new
    end
  end
end

Mastermind.new.play
