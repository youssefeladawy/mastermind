require_relative 'display'
require_relative 'logic'
class Mastermind
  include Display

  def play
    manual_script
    Logic.new.game
  end
end

Mastermind.new.play
