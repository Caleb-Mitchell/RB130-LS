class Diamond
  ALPHA_ARRAY = ('A'..'Z').to_a

  def self.make_diamond(letter)
    alpha_index = ALPHA_ARRAY.index(letter)
    outer_spaces = alpha_index

    diamond_string = ''
    draw_point(diamond_string, outer_spaces)
    return diamond_string if letter == 'A'
    draw_inner_top(diamond_string, outer_spaces, alpha_index) if alpha_index > 1
    draw_middle(diamond_string, alpha_index)
    draw_inner_bottom(diamond_string, alpha_index) if alpha_index > 1
    draw_point(diamond_string, outer_spaces)

    diamond_string
  end

  class << self
    private

    def draw_point(string, num_spaces)
      string << (' ' * num_spaces)
      string << 'A'
      string << (' ' * num_spaces)
      string << "\n"
      string
    end

    def draw_middle(string, alpha_index)
      string << ALPHA_ARRAY[alpha_index]
      string << (' ' * (1 + (2 * (alpha_index - 1))))
      string << ALPHA_ARRAY[alpha_index]
      string << "\n"
    end

    def draw_inner_top(string, outer_spaces, alpha_index)
      inner_spaces = 1
      outer_spaces -= 1

      (1...alpha_index).each do |num|
        make_row(string, num, outer_spaces, inner_spaces)
        outer_spaces -= 1
        inner_spaces += 2
      end
    end

    def draw_inner_bottom(string, alpha_index)
      inner_spaces = 1 + (2 * (alpha_index - 2))
      outer_spaces = 1

      (alpha_index - 1).downto(1) do |num|
        make_row(string, num, outer_spaces, inner_spaces)
        outer_spaces += 1
        inner_spaces -= 2
      end
    end

    def make_row(string, num, outer_spaces, inner_spaces)
      string << (' ' * outer_spaces)
      string << ALPHA_ARRAY[num]
      string << (' ' * inner_spaces)
      string << ALPHA_ARRAY[num]
      string << (' ' * outer_spaces)
      string << "\n"
    end
  end
end
