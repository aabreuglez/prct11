class Lista 
  attr_reader :cabeza, :cola
  include Enumerable
  
  def initialize(nodes)
    for i in 0..nodes.length-1 do
      nodes[i]=Node.new(nodes[i],nil,nil)
    end
    
    j = nodes.length
    j -= 1
    @cola = nodes[0]
    @cabeza = nodes[j]
    if j > 1
      @cola.next = nodes[1]
      for i in 1..j-1 do
        nodes[i].next = nodes[i+1]
        nodes[i].prev = nodes[i-1]
      end
      @cabeza.prev = nodes[j-1]
    else 
      if j == 1
        @cabeza.prev = @cola
        @cola.next = @cabeza
      else
        @cabeza = @cola
      end
    end
   
  end
  
  def pop_back
    raise if @cabeza == @cola
    
    backup = @cabeza.value
    @cabeza = @cabeza.prev
    backup
  end
  
  def pop_front
    raise if @cabeza == @cola
    
    backup = @cola.value
    @cola = @cola.next
    backup
  end
  
  def push_front(node)
    node = Node.new(node,nil,nil)
    @cola.prev = node
    node.next = @cola
    @cola = node
  end

  def push_back(node)
    node = Node.new(node,nil,nil)
    @cabeza.next = node
    node.prev = @cabeza
    @cabeza = node
  end
  
  def push_much_back(nodes)
    raise unless nodes.is_a? Array
    for i in 0..nodes.length-1 do
      nodes[i]=Node.new(nodes[i],nil,nil)
    end
    j = nodes.length
    j -= 1
    for i in 0..j do
       @cabeza.next = nodes[i]
       nodes[i].prev = @cabeza
       @cabeza = nodes[i]
      
    end
  end
  
  def push_much_front(nodes)
    raise unless nodes.is_a? Array
    for i in 0..nodes.length-1 do
      nodes[i]=Node.new(nodes[i],nil,nil)
    end
    j = nodes.length
    j -= 1
    for i in 0..j do
       @cola.prev = nodes[i]
       nodes[i].next = @cola
       @cola = nodes[i]
    end
  end  
  def pop_much_front(number)
    raise unless number.is_a? Integer
    array = []
    for i in 0..number-1 do
      array[i] = @cola
      @cola = cola.next
      @cola.prev = nil
    end
    array
  end

  def pop_much_back(number)
    raise unless number.is_a? Integer
    array = []
    for i in 0..number-1 do
      array[i] = @cabeza
      @cabeza = cabeza.prev
      @cabeza.next = nil
    end
    array
  end
  
  def toHead
    actual = @cola
    while actual.next != nil do
      actual = actual.next
    end
    actual
  end
  
  def toTail
    actual = @cabeza
    while actual.prev != nil do
      actual = actual.prev
    end
    actual
  end  
  
  def each(&block)
     actual = @cola
     while actual != nil do
        yield actual
        actual = actual.next
     end
  end
  
  def to_s
     y="" 
     self.each{ |x| y+=x.value.to_s }
     y
  end
end