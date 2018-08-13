class Tree
	attr_accessor :children, :node_name

	def initialize(name, children=[])
		@node_name = name
		@children = children
	end

	def visit_all(&block)
		visit &block
		children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

fish_tree = Tree.new('Seafish',
	[Tree.new('dorade'), Tree.new('salmon')]
)

puts 'Visiting the current node'
fish_tree.visit {|node| puts node.node_name}
puts

puts 'Visiting entire tree'
fish_tree.visit_all {|node| puts node.node_name}
