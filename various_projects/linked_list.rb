class LinkedList
  attr_accessor :name

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  # adds new node containing value at end of list
  def append(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      @tail.next = value
      value.previous = @tail
      @tail = value
    end
    @size += 1
  end
  # adds new node containing value at start of list
  def prepend(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      value.next = @head
      value.previous = value
      @head = value
    end
    @size += 1
  end
  # returns the total number of nodes
  def size
    @size
  end
  # returns first node in the list
  def head
    @head
  end
  # returns last node in the list
  def tail
    @tail
  end
  # returns node at given index
  def at(index)
    pointer = @head
    index.times {pointer = pointer.next}
    pointer
  end
  # removes last element from list
  def pop
    return if @head.nil?
    @tail = tail.previous
    @tail.next = @tail
    @size -= 1
  end
  # returns true if value is in the list
  def contains?(value)
    return true if find(value)
    false
  end
  # returns index of specified value in the list
  def find(value)
    pointer = @head
    index = 0
    size.times do
      return index if pointer == value

      pointer = pointer.next
      index += 1
    end
    nil
  end
  # represents the linkedlist object as string
  def to_s
    str = ''
    pointer = @head
    size.times do
      str += "(#{pointer.data}) -> "
      pointer = pointer.next
    end
    str += 'nil'
  end
  # inserts new node with provided value at given index
  def insert_at(value,index)
    pointer = @head
    (index - 1).times do
      raise "List not long enough" if pointer.nil?
      pointer = pointer.next
    end
    @size += 1
    new_node = Node.new(value)
    new_node.next = pointer.next
    pointer.next = new_node
  end
  # removes node at given index
  def remove_at(index)
    pointer = @head
    (index - 1).times do
      raise "List not long enough" if pointer.nil?
      pointer = pointer.next
    end
    pointer.next = pointer.next.next
    @size -= 1
  end

end
class Node
  attr_accessor :next, :previous, :data
  def initialize(data, pointer = nil)
    @next = nil
    @previous = nil
    @data = data
  end
end

linkedlist = LinkedList.new

node1 = Node.new(5)
node2 = Node.new("pie")
node3 = Node.new(49)
node4 = Node.new("pizza")
node5 = Node.new("candy")

linkedlist.prepend(node1)
linkedlist.append(node2)
linkedlist.prepend(node3)
linkedlist.append(node4)
linkedlist.append(node5)
# p linkedlist.head
# p linkedlist.tail
# p linkedlist.at(2).data
# linkedlist.pop
# p linkedlist.size
# linkedlist.append(node4)
# p linkedlist.size
# p linkedlist.contains?(node1)
# p linkedlist.contains?(100)
# p linkedlist.find(node2)
# p linkedlist.find(node4)

linkedlist.insert_at("cake",2)
linkedlist.insert_at("bacon",3)
linkedlist.remove_at(4)
p linkedlist.to_s
