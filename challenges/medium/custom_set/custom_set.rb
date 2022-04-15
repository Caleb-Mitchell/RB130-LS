class CustomSet
  attr_accessor :array

  def initialize(array=[])
    @array = array
  end

  def empty?
    array.empty?
  end

  def contains?(num)
    array.include?(num)
  end

  def subset?(set)
    return true if empty?
    return true if array.all? { |num| set.array.include?(num) }
    false
  end

  def disjoint?(set)
    # returns true if the calling set and the given enumerable have
    # no element in common
    return true if empty? || set.empty?
    return true if array.none? { |num| set.array.include?(num) }
    false
  end

  def eql?(set)
    array.sort.uniq == set.array.sort.uniq
  end

  def add(num)
    self.array = (array + [num]).uniq
    self
  end

  def ==(other)
    array == other.array
  end

  def intersection(set)
    inter = []
    array.each { |ele| inter << ele if set.array.include?(ele) }
    CustomSet.new(inter)
  end

  def difference(set)
    diff = []
    array.each { |ele| diff << ele unless set.array.include?(ele) }
    CustomSet.new(diff)
  end

  def union(set)
    new_set = []
    new_set += array
    new_set += set.array
    CustomSet.new(new_set.uniq.sort)
  end
end
