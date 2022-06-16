require_relative 'instructions'
require 'colorize'

module Display
  include Instructions
  def manual_script
    puts manual
  end

  def color_numbers(number)
    case number
    when 1
      print "#{"  #{number}  ".colorize(:color => :white, :background => :red)}\t"
    when 2
      print "#{"  #{number}  ".colorize(:color => :white, :background => :blue)}\t"
    when 3
      print "#{"  #{number}  ".colorize(:color => :white, :background => :green)}\t"
    when 4
      print "#{"  #{number}  ".colorize(:color => :white, :background => :yellow)}\t"
    when 5
      print "#{"  #{number}  ".colorize(:color => :white, :background => :cyan)}\t"
    when 6
      print "#{"  #{number}  ".colorize(:color => :white, :background => :magenta)}\t"
    end
  end

  def indicator (correct_position, correct_number)
    print 'Indicator(s):'
    correct_position.times { print "#{' O '.colorize(:background => :white)}  " }
    correct_number.times { print "#{' O '.colorize(:background => :red)}  " }
  end

  def color(array)
    array.each { |element| color_numbers(element) }
  end
end
