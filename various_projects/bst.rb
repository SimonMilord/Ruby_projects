class Node
attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

class Tree
attr_accessor :root, :data

  def initialize(array)
    @data = array.sort.uniq
    @root = build_tree(data)
  end

  def build_tree(array)
    return nil if array.empty?

    mid = (array.size - 1) / 2
    root_node = Node.new(array[mid])

    root_node.left = build_tree(array[0...mid])
    root_node.right = build_tree(array[(mid + 1)..-1])

    root_node
  end

  def insert(value, node = root)
    return nil if value == node.data

    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    else
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
  end

  def delete(value, node = root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      # one or no child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # two children
      leftmost_node = leftmost_leaf(node.right)
      node.data = leftmost_node.data
      node.right = delete(leftmost_node.data, node.right)
    end
    node
  end

  def find(value, node = root)
    return node if node.nil? || node.data == value

    value < node.data ? find(value, node.left) : find(value, node.right)

  end

  def level_order(node = root, queue = [])
    print "#{node.data} "
    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    return if queue.empty?

    level_order(queue.shift, queue)
  end

  def inorder(node = root)
    return if node.nil?

    inorder(node.left)
    print "#{node.data} "
    inorder(node.right)
  end

  def preorder(node = root)
    return if node.nil?

    print "#{node.data} "
    preorder(node.left)
    preorder(node.right)
  end

  def postorder(node = root)
    return if node.nil?

    postorder(node.left)
    postorder(node.right)
    print "#{node.data} "
  end

  def height(node = root)
    return 0 if node.nil?

    left = node.left ? height(node.left) : 0
    right = node.right ? height(node.right) : 0
    left > right ? left + 1 : right + 1
  end

  def depth(node = root, parent = root, edges = 0)
    return 0 if node == parent
    return -1 if parent.nil?

    if node < parent.data
      edges += 1
      depth(node, parent.left, edges)
    elsif node > parent.data
      edges += 1
      depth(node, parent.right, edges)
    else
      edges
    end
  end

  def balanced?(node = root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

    false
  end

  def rebalance
    self.data = inorder_array
    self.root = build_tree(data)
  end

  def pretty_print(node = root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def leftmost_leaf(node)
    node = node.left until node.left.nil?

    node
  end

  def inorder_array(node = root, array = [])
    unless node.nil?
      inorder_array(node.left, array)
      array << node.data
      inorder_array(node.right, array)
    end
    array
  end

end

array = Array.new(10) { rand(1..100)}

# smaller tests of individual methods

# build_tree
# bst = Tree.new(array)
# bst.pretty_print

# insert
# a = rand(1..100)
# bst.insert(a)
# bst.pretty_print
# puts "Inserted #{a} to tree."

# delete
# array_del = [20,30,32,34,36,40,50,60,65,70,75,80,85]
# a = 20
# bst_del = Tree.new(array_del)
# bst_del.pretty_print
# bst_del.delete(a)
# bst_del.pretty_print
# puts "Deleted #{a} to tree."

# find
# array_find = [20,30,32,34,36,40,50,60,65,70,75,80,85]
# a = 30
# bst_find = Tree.new(array_find)
# bst_find.find(a)
# puts "Found #{a} in the tree"

# level_order
# puts 'Level order traversal: '
# puts bst.level_order

# preorder
# puts 'Preorder traversal: '
# puts bst.preorder

# inorder
# puts 'Inorder traversal: '
# puts bst.inorder

# postorder
# puts 'Postorder traversal: '
# puts bst.postorder

# height
# puts bst.pretty_print
# puts bst.height

# depth
# array_depth = [20,30,32,34,36,40,50,60,65,70,75,80,85]
# a = 80
# bst_depth = Tree.new(array_depth)
# puts bst_depth.pretty_print
# b = bst_depth.depth(a)
# puts "node depth of #{a} is: #{b} "

# balanced?
# puts bst.pretty_print
# puts bst.balanced?


# tie it all together -- DRIVER SCRIPT

new_array = (Array.new(15) { rand(1..100) })

tree = Tree.new(new_array)
# puts tree.pretty_print

puts tree.balanced?

puts "Preorder: "
puts tree.preorder
puts "Inorder: "
puts tree.inorder
puts "Postorder: "
puts tree.postorder
puts "Level order: "
puts tree.level_order

tree.insert(101)
tree.insert(123)
tree.insert(150)
tree.insert(191)
tree.insert(200)
tree.insert(252)
tree.insert(300)

# puts tree.pretty_print

puts tree.balanced?
tree.rebalance
puts tree.balanced?

puts "Preorder: "
puts tree.preorder
puts "Inorder: "
puts tree.inorder
puts "Postorder: "
puts tree.postorder
puts "Level order: "
puts tree.level_order

