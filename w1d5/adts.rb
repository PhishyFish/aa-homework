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
  def enqueue(el)
  end

  def dequeue
  end

  def show
  end
end

class Map
  def assign(key, val)
  end

  def lookup(key)
  end

  def remove(key)
  end

  def show
  end
end
