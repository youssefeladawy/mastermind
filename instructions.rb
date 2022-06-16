require 'colorize'

module Instructions
  def manual
    <<~HEREDOC
      #{"How to play Mastermind?:".underline}
      Your goal is to either outsmart your opponent with a clever code or great guesswork.

      You have two options two choose from option number 1 is #{'the Codemaker:'.underline} 
      your goal is to set a mystery code so cunning that it will keep your opponent guessing for as long as possible.
      Option number 2 is #{'the Decoder:'.underline} you must break the secret code in 12 guesses or less.

      As the game starts the Codemaker will create a code that can be made up of any combination of 4 numbers
      chosen from (1 to 6 -- Duplicate numbers are allowed)

      #{'  1  '.colorize(:color => :white, :background => :red)}, #{'  2  '.colorize(:color => :white, :background => :blue)}, #{'  3  '.colorize(:color => :white, :background => :green)}, #{'  4  '.colorize(:color => :white, :background => :yellow)}, #{'  5  '.colorize(:color => :white, :background => :cyan)}, #{'  6  '.colorize(:color => :white, :background => :magenta)}

      #{'For Example'.underline}  #{'  1  '.colorize(:color => :white, :background => :red)} #{'  4  '.colorize(:color => :white, :background => :yellow)} #{'  6  '.colorize(:color => :white, :background => :magenta)}, #{'  4  '.colorize(:color => :white, :background => :yellow)}
      
      Once the code is set, the Decoder can begin guessing the code.
      After each guess, you will get up to 4 indicators that shows the status of your guess
      A red indicator means that you have a correct number in the wrong position
      A white indicator means that you have a correct number in the correct Position
      
      #{'For Example'.underline}:
      #{'  4  '.colorize(:color => :white, :background => :yellow)} #{'  1  '.colorize(:color => :white, :background => :red)} #{'  6  '.colorize(:color => :white, :background => :magenta)} #{'  5  '.colorize(:color => :white, :background => :cyan)} Indicator(s): #{' O '.colorize(:background => :white)} #{' O '.colorize(:background => :red)} #{' O '.colorize(:background => :red)}

      Please selection one option of the following:
      Press '1' to be the #{'the Codemaker'.underline}
      Press '2' to be the #{'the Codebreaker'.underline}
    HEREDOC
  end
end
