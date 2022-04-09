class SimpleLinkedList
  attr_accessor :size

  def initialize(size=0)
    @size = size
  end

  def empty?
    size.zero?
  end

  # how many elements are created?
  def push(num)
    self.size = num
  end

  # peek returns the datum held by held, without removing (this is the size)
  # if size is zero, peek should return nil
  def peek
    size.zero? ? nil : size
  end

  # head should return the element at the top! of the list
  def head
    Element.new(size, Element.new(size - 1))
  end

  def pop
    self.size -= 1
    size + 1
  end

  def self.from_a(array)
    return SimpleLinkedList.new if array.nil? || array.empty?
    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end
end

class Element
  attr_reader :datum, :next_ele

  def initialize(datum, next_ele=nil)
    @datum = datum
    @next_ele = next_ele
  end

  # check if pointer to next element is nil
  def tail?
    next_ele.nil? || datum == 1
    # datum == 1
  end

  # return what pointer to next element down is, if nothing, then nil
  def next
    next_ele
  end
end
