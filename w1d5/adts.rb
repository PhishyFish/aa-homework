class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, val)
    if lookup(key)
      @map.map { |pair| pair[1] = val if pair[0] == key }
    else
      @map << [key, val]
    end
  end

  def lookup(key)
    tuple = @map.select { |pair| pair[0] == key }
    tuple.flatten[1]
  end

  def remove(key)
    tuple = @map.select { |pair| pair[0] == key }
    @map.delete(tuple.flatten)
  end

  def show
    @map
  end
end
