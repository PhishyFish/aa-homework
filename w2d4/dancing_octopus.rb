require "benchmark"

# Slow Dance
# O(n) time
def slow_dance(direction, arr)
  arr.each_with_index { |dir, tile| return tile if dir == direction }
end

# Constant Dance
# O(1) time
def fast_dance(direction, hsh)
  hsh[direction]
end

tiles_array = [
  "up", "right-up", "right", "right-down",
  "down", "left-down", "left", "left-up"
]
tiles_hash = {
  "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
  "down" => 4, "left-down" => 5, "left" => 6, "left-up" => 7
}

puts "'up' => 0, 'right-down' => 3\n\n"
puts "Method => Return Value || Runtime"
puts "slow_dance('up', tiles_array) => #{slow_dance('up', tiles_array)} || #{Benchmark.realtime { slow_dance('up', tiles_array) }}"
puts "slow_dance('right-down', tiles_array) => #{slow_dance('right-down', tiles_array)} || #{Benchmark.realtime { slow_dance('right-down', tiles_array) }}"
puts "fast_dance('up', tiles_hash) => #{fast_dance('up', tiles_hash)} || #{Benchmark.realtime { fast_dance('up', tiles_hash) }}"
puts "fast_dance('right-down', tiles_hash) => #{fast_dance('right-down', tiles_hash)} || #{Benchmark.realtime { fast_dance('right-down', tiles_hash) }}"
