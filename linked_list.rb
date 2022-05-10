# frozen_string_literal: true

class LinkedList
  attr_reader :head, :tail, :size

  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end

  def append(value)
    @size += 1
    new_node = Node.new(value)
    @tail&.next_node = new_node
    @tail = new_node
    @head = new_node if @head.nil?
    new_node
  end

  def prepend(value)
    @size += 1
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    @tail = new_node if @tail.nil?
    new_node
  end

  def at(index)
    return nil if index > @size - 1 || index.negative?

    current_node = @head
    current_index = 0
    until current_index == index
      current_index += 1
      current_node = current_node&.next_node
    end
    current_node
  end

  def pop
    new_final_node = at(size - 2)
    popped_node = @tail
    @tail = new_final_node
    new_final_node&.next_node = nil # unless new_final_node.nil?
    @size -= 1
    @head = nil if @tail.nil?
    popped_node
  end

  def contains?(value)
    current_node = @head
    until current_node.next_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    index = 0
    until current_node.next_node.nil?
      return index if current_node.value == value

      index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def to_s
    current_node = @head
    string_rep = ''
    until current_node.nil?
      string_rep += "( #{current_node&.value} ) -> "
      current_node = current_node.next_node
    end
    "#{string_rep}( nil )"
  end

  def insert_at(value, index)
    prev_node = at(index - 1)
    prev_node&.next_node = Node.new(value, prev_node.next_node)
    @size += 1
    self
  end

  def remove_at(index)
    prev_node = at(index - 1)
    @size -= 1 unless size.zero?
    prev_node&.next_node = prev_node&.next_node&.next_node
    @tail = prev_node if prev_node.next_node.nil?
    self
  end
end



class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

test = LinkedList.new
test.append('a')
test.append('b')
test.append('c')

p test.to_s
test.insert_at('hello', 1)
test.remove_at(3)
p test.to_s
p test.tail.value

# p test.to_s
#p test.to_s
#test.remove_at(2)
#p test.to_s

# p test.at(1)