class SimpleLinkedList
  attr_accessor :size, :head

  def initialize
    @size = 0
    @head = nil
  end

  def empty?
    size == 0
  end

  def peek
    return nil if empty? || head.nil?
    head.datum
  end

  def push(num)
    self.size += 1
    self.head = Element.new(num, head)
  end

  def pop
    popped_datum = peek
    self.size -= 1
    self.head = head.next
    popped_datum
  end

  # convert empty array to linked list
  def self.from_a(array)
    return SimpleLinkedList.new if array.nil? || array.empty?
    list = SimpleLinkedList.new
    array.reverse_each { |num| list.push(num) }
    list
  end

  def to_a
    array = []
    return array if size.zero?

    list_copy = dup
    loop do
      array << list_copy.pop
      break if list_copy.head.nil?
    end
    array
  end

  def reverse
    new_list = SimpleLinkedList.new
    list_copy = dup

    loop do
      new_list.push(list_copy.pop)
      break if list_copy.head.nil?
    end
    new_list
  end
end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end
