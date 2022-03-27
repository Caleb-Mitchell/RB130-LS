=begin
Problem:
Write a problem that can calculate the Hamming distance between two DNA strands

input: two strings representing DNA strands, one passed to the constructor, and
one passed as an argument to the method
output: an integer, the hamming distance, or number of differences between the
two strings

rules:
- the distance is only defined for sequences of equal length
  - if the lengths are different, compute only the length of the smaller string
  * do not alter original string for comparison sake

MM:
- init difference counter to 0
 - for each character in original string (with index):
   - next if char at index of other strand is empty
   - if char is different than char at index of other strand, add one to counter
- return counter
=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand_two)
    hamming_distance = 0

    strand.each_char.with_index do |char, idx|
      break if strand_two.chars[idx].nil?
      hamming_distance += 1 unless char == strand_two[idx]
    end
    hamming_distance
  end
end
