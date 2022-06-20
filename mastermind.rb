require_relative 'display'
require_relative 'player'

class Mastermind
  include Display

  def select_mode
    selection = gets.chomp.to_i
    case selection
    when 1
      puts "You're the Codemaker"
      Player.new.code_maker
    when 2
      puts "You're the Codebreakr"
      Player.new.game
    else
      puts 'Please select either 1 or 2'
      select_mode
    end
  end

  def play
    manual_script
    select_mode
  end
end
