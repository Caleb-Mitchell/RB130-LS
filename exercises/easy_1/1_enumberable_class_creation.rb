class Tree
  include Enumerable

  def initialize
    @binary_tree = []
  end

  def each
    @binary_tree.each { |ele| yield(ele) }
  end
end

# to provide functionality of the `Enumerable` module, you need to:
# 1. include Enumerable
# 2. define an each method
