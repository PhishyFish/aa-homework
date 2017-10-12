require "benchmark"

# Sluggish Octopus
# O(n^2) time

def sluggish(arr)
  arr.each_with_index do |fish1, idx1|
    big_fish = true

    arr.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      big_fish = false if fish2.length > fish1.length
    end

    return fish1 if big_fish
  end
end

# Dominant Octopus
# O(n log n) time

def dominant(arr, &prc)
  prc = Proc.new { |fish1, fish2| fish2.length <=> fish1.length }
  arr.merge_sort(&prc).first
end

class Array
  def merge_sort(&prc)
    return self if size <= 1
    prc ||= Proc.new { |x, y| x <=> y }

    mid = size / 2
    left = take(mid).merge_sort(&prc)
    right = drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        merged << right.shift
      else
        merged << left.shift
      end
    end

    merged + left + right
  end
end


# Clever Octopus
# O(n) time

def clever(arr)
  arr.reduce do |big_fish, fish|
    fish.length > big_fish.length ? fish : big_fish
  end
end

def clever2(arr)
  big_fish = arr.first
  arr.each { |fish| big_fish = fish if fish.length > big_fish.length }
  big_fish
end

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
puts "fishies = #{fishies}
=> fiiiissshhhhhh\n\n"
puts "Method => Return Value || Runtime"
puts "sluggish(fishies) => #{sluggish(fishies)} || #{Benchmark.realtime { sluggish(fishies) }}"
puts "dominant(fishies) => #{dominant(fishies)} || #{Benchmark.realtime { dominant(fishies) }}"
puts "clever(fishies) => #{clever(fishies)} || #{Benchmark.realtime { clever(fishies) }}"
puts "clever2(fishies) => #{clever2(fishies)} || #{Benchmark.realtime { clever2(fishies) }}"
