
# Mastermind

Mastermind is a single player game where the player's goal is to either outsmart the computer with a clever code or great guesswork.

You have two options two choose from  

Option number 1 is the Codemaker 
your goal is to set a mystery code so cunning that it will keep your opponent guessing for as long as possible.  

Option number 2 is The Codebreaker you must break the secret code in 12 guesses or less.

As the game starts the Codemaker will create a code that can be made up of any combination of 4 numbers
chosen from (1 to 6 -- Duplicate numbers are allowed)  
1  ,   2  ,   3  ,   4  ,   5  ,   6  

For Example    1     4     6     4  

Once the code is set, the Codebreaker can begin guessing the code.  
After each guess, you will get up to 4 indicators that shows the status of your guess,  
a red indicator means that you have a correct number in the wrong position  
a white indicator means that you have a correct number in the correct position.

For Example:  4     1     6     5   Indicator(s):  **O**   O   O 



## Installation

You can play this online via the following link. 

or clone this repo to your PC and run it by doing the following
```bash
  gem install colorize
  cd your-directory/mastermind
  ruby main.rb
```