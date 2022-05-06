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
    @tail.next_node = new_node unless @tail.nil?
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
    current_node = @head
    current_index = 0
    until current_index == index
      current_index += 1
      current_node = current_node.next_node unless current_node.nil?
    end
    current_node
  end
end

class Node
  attr_reader :value
  attr_accessor :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end