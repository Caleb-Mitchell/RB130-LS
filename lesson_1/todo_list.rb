# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(other_todo)
    title == other_todo.title &&
      description == other_todo.description &&
      done == other_todo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.is_a? Todo

    @todos << todo
  end
  alias << add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(idx)
    @todos.fetch(idx)
  end

  def mark_done_at(idx)
    # raise IndexError if @todos[idx].nil?
    # @todos[idx].done!
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    # raise IndexError if @todos[idx].nil?
    # @todos[idx].undone!
    item_at(idx).undone!
  end

  def done!
    # @todos.each(&:done!)
    @todos.each_index do |idx|
      mark_done_at(idx)
    end
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(idx)
    # raise IndexError if @todos[idx].nil?
    # @todos.delete_at(idx)
    @todos.delete(item_at(idx))
  end

  def to_s
    puts "---- Today's Todos ----"
    @todos.each { |todo| puts todo }
  end

  def each
    # counter = 0

    # while counter < size
    #   yield(@todos[counter])
    #   counter += 1
    # end

    # @todos

    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    list = TodoList.new(title)
    @todos.each do |todo|
      list << todo if yield(todo)
    end
    list
  end

  def find_by_title(title)
    # return the first Todo object that matches the argument

    # each do |todo|
    #   return todo if todo.title == string
    # end
    # nil
    select { |todo| todo.title == title  }.first
  end

  def all_done
    select(&:done?)
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(title)
    # each do |todo|
    #   if todo.title == string
    #     todo.done! 
    #     break
    #   end
    # end
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list << (todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# ---- mark_done ---- #

# list.mark_done("Buy milk")
# p list

# ---- all_done / all_not_done ---- #

# todo2.done!
# p list.all_done
# p list.all_not_done


# ---- find_by_title ---- #
# p list.find_by_title("Go to gym")

# ---- Custom #each method ---- #

# list.each do |todo|
#   puts todo
# end

# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# ---- Custom #select method ---- #

# todo1.done!
# results = list.select { |todo| todo.done? }    # you need to implement this method
# puts results.inspect

# <<
# same behavior as add

# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# p list.first                      # returns todo1, which is the first item in the list

# # last
# p list.last                       # returns todo3, which is the last item in the list

# #to_a
# p list.to_a                      # returns an array of all items in the list

# #done?
# p list.done?                     # returns true if all todos in the list are done, otherwise false

# # ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# p list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# list.mark_undone_at(100)        # raises IndexError

# # done!
# list.done!                      # marks all items as done

# # ---- Deleting from the list -----

# # shift
# list.shift                      # removes and returns the first item in list

# # pop
# list.pop                        # removes and returns the last item in list

# # remove_at
# list.remove_at                  # raises ArgumentError
# p list.remove_at(1)               # removes and returns the 2nd item
# p list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym
