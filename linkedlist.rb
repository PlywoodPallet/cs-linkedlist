class LinkedList
  def initialize
    @node_list = nil
  end



end


class Node
  attr_accessor :value, :next_node

  def initialize
  @value = nil
  @next_node = nil
  end

end


a_node = Node.new()
a_node.value = "a value"
p a_node