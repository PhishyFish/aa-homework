class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.count
  end

  def add(el)
    # adds element to cache according to LRU principle
    remove(el)
    remove_lru
    @cache << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @cache
    nil
  end

  private
  # helper methods go here!
  def remove(el)
    @cache.delete(el) if @cache.include?(el)
  end

  def remove_lru
    @cache.shift if count >= @size
  end
end
