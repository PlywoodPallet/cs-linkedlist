class LinkedList
  attr_accessor :node_list

  def initialize
    # an array of nodes
    @node_list = []
  end

  # add a new node containing value to the end of the list
  def append(value)
    # create new node with value. This node points to nil by default
    new_node = Node.new(value)
    old_last_node = @node_list.last

    # point previous last node to new node
    # if the node_list is empty, ignore this
    unless old_last_node.nil? then old_last_node.next_node = new_node end

    # add node to the end list
    @node_list.push(new_node)
  end

  # add a new node containing value to the beginning of the list
  def prepend(value)
    # create new node with value. This node points to nil by default
    new_node = Node.new(value)
    old_first_node = @node_list.first

    # unless the list is empty, point the new node to the old first node
    unless old_first_node.nil?
      new_node.next_node = old_first_node
    end

    # add the new node to the beginning of the list
    @node_list.unshift(new_node)
  end


  # inserts a new node with the provided value at the given index
  # valid indexies are 0-@node_list.size (one index after end of array is still valid for an insertion)
  # if the index is 0, ignore prev since it's negative index and prev_node
  def insert_at(value, index)
    prev = index - 1
    
    if prev >= 0
      prev_node = @node_list[prev]
    end

    post_node = @node_list[index]

    new_node = Node.new(value, post_node)

    if prev >= 0
      prev_node.next_node = new_node
    end

    @node_list.insert(index, new_node)
  end

  # that removes the node at the given index
  def remove_at(index)
    prev = index - 1
    
    # if index is the last node, repair link
    if index == @node_list.size-1
      prev_node = @node_list[prev]

      # prev node is now the last node
      prev_node.next_node = nil

    # if index is positive, repair link
    elsif prev >= 0
      prev_node = @node_list[prev]

      # repair link before removing node
      prev_node.next_node = @node_list[index+1]
    end

    

    @node_list.delete_at(index)
    puts @node_list

  end

  def size
    @node_list.size
  end

  def head
    @node_list.first
  end

  def tail
    @node_list.last
  end

  def at(index)
    @node_list[index]
  end

  # removes the last element from the list
  # changes next_node of new last node to point ot nil
  def pop
    @node_list.pop
    new_tail = tail
    new_tail.next_node = nil
    new_tail
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    @node_list.find_index { |node| node.value == value }
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    result_index = find(value)

    result_index.nil? ? false : true
  end

  # desired formatting: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s

    # grab all the values of each node based on next_node, put them in an array
    value_array = []
    value_array.push(head.value)
    @node_list.each do |node|
      next_node = node.next_node
      
      if (next_node.nil?)
        value_array.push(nil)
      else
        value_array.push(next_node.value)
      end
    end

    # use the array to output the correct formatting
    output_string = ''
    value_array.each do |value|
      if (value.nil?)
        output_string += "nil"
      else
        output_string += "( #{value} ) -> "
      end
    end

    output_string
  end

end


class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  # for debugging, for some reason attr_accessor isn't working
  def return_value
    @value
  end

  def to_s
    "[value: #{value} next_node:#{next_node}]"
  end
end


a_list = LinkedList.new
a_list.append('0')
a_list.append('1')
a_list.append('2')
a_list.append('3')
puts a_list

# node_list = a_list.node_list
# p search_hits = node_list.select { |node| node.value == "sdas" }