require_relative 'display'

module Logic
  include Display
  
  def win?(guess_array, game_array)
    return true if game_array == guess_array
  end

  def round(guess_array, game_array)
    cloned_guess_arr = guess_array.clone
    cloned_game_arr = game_array.clone
    correct_position_numbers(cloned_game_arr, cloned_guess_arr)
  end

  def correct_position_numbers(cloned_game_arr, cloned_guess_arr)
    correct_position_indicator = 0
    cloned_guess_arr.each_with_index do |guess, i|
      next unless guess == cloned_game_arr[i]

      correct_position_indicator += 1
      cloned_game_arr[i] = 'position'
      cloned_guess_arr[i] = 'marked'
    end
    correct_numbers(cloned_game_arr, cloned_guess_arr, correct_position_indicator)
  end

  def correct_numbers(cloned_game_arr, cloned_guess_arr, correct_position_indicator)
    correct_indicator = 0
    cloned_guess_arr.each do |guess|
      next unless cloned_game_arr.include?(guess)

      correct_indicator += 1
    end
    indicator(correct_position_indicator, correct_indicator) if correct_indicator > 0 || correct_position_indicator > 0
  end
end
