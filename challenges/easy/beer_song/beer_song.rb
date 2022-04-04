class BeerSong
  def self.verse(verse_num)
    if verse_num > 2
      over_two_bottles(verse_num)
    elsif verse_num == 2
      two_bottles
    elsif verse_num == 1
      one_bottle
    else
      no_bottles
    end
  end

  def self.verses(first_verse_num, last_verse_num)
    result = ''
    first_verse_num.downto(last_verse_num) do |num|
      result << if num == last_verse_num
                  verse(num)
                else
                  verse(num) + "\n"
                end
    end
    result
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def over_two_bottles(verse_num)
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles " \
      "of beer.\nTake one down and pass it around, #{verse_num - 1} bottles " \
      "of beer on the wall.\n"
    end

    def two_bottles
      "2 bottles of beer on the wall, 2 bottles " \
      "of beer.\nTake one down and pass it around, 1 bottle " \
      "of beer on the wall.\n"
    end

    def one_bottle
      "1 bottle of beer on the wall, 1 bottle " \
      "of beer.\nTake it down and pass it around, no more bottles " \
      "of beer on the wall.\n"
    end

    def no_bottles
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end
