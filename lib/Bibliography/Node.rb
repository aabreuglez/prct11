# create a Struct with :value and :next
Node = Struct.new :value, :next, :prev

class Node 
	def <=> other
		return unless other.is_a? Node
		value <=> other.value
	end
end