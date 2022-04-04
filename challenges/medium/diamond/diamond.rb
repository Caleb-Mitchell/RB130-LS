class Diamond
  def self.make_diamond(letter)
    alpha_array = ('A'..'Z').to_a
    alpha_counter = 0
    outer_spaces = alpha_array.index(letter)
    inner_spaces = 0
    num_letters = 1

    diamond_string = ''
    until alpha_counter == alpha_array.index(letter) + 1
      diamond_string << (' ' * outer_spaces)
      diamond_string << alpha_array[alpha_counter]
      if num_letters == 1
        diamond_string << (' ' * outer_spaces)
        diamond_string << "\n"

        num_letters += 1 unless num_letters == 2
        alpha_counter += 1
        outer_spaces -= 1
        inner_spaces += 1
        next
      else
        diamond_string << (' ' * inner_spaces)
        diamond_string << alpha_array[alpha_counter]
        diamond_string << (' ' * outer_spaces)
        diamond_string << "\n"
      end

      num_letters += 1 unless num_letters == 2
      alpha_counter += 1
      outer_spaces -= 1
      inner_spaces += 1
    end
    diamond_string
  end
end
