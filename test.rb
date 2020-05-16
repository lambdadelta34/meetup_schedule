#!/bin/ruby
# frozen_string_literal: true

require './main'
require 'benchmark'

# p count_meetings([1], [3]) == 1
# p count_meetings([1, 1], [1, 1]) == 1
# p count_meetings([1, 256], [1, 256]) == 2
# p count_meetings([1, 1, 1], [1, 1, 2]) == 2
# p count_meetings([1, 2, 3, 1], [3, 3, 3, 4]) == 4
# p count_meetings([1, 2, 3, 4], [3, 3, 3, 7]) == 4
# p count_meetings([1, 1, 1, 1], [1, 1, 3, 3]) == 3
# p count_meetings([3, 2, 3, 3], [3, 4, 5, 7]) == 4
# p count_meetings([1, 2, 1, 2, 2], [3, 2, 1, 3, 3]) == 3
# p count_meetings([3, 2, 3, 3, 4, 4, 4], [3, 4, 5, 7, 4, 4, 4]) == 5
# p count_meetings([1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]) == 10
# p count_meetings([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]) == 10
# p count_meetings([10, 20, 30, 40, 50, 60, 70, 80, 90, 100], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100]) == 10
# p count_meetings([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) == 10
# p count_meetings((1..100_000).to_a, (1..100_000).to_a) == 100_000
# p count_meetings([3, 2, 5, 1, 1], [5, 4, 5, 3, 4]) == 5
# p count_meetings([1, 4, 1, 4, 2, 3, 3], [3, 4, 2, 4, 3, 4, 4]) == 4

test_size = 1_000_000
sam = (1..test_size).to_a
fd = Array.new(test_size) { sam.sample }
ld = fd.map { |i| [test_size, i + sam.sample].min }
Benchmark.bmbm do |bm|
  bm.report('array<integer> ordered') do
    count_meetings1((1..test_size).to_a, (1..test_size).to_a)
  end
end
Benchmark.bmbm do |bm|
  bm.report('string ordered') do
    count_meetings2((1..test_size).to_a, (1..test_size).to_a)
  end
end
Benchmark.bmbm do |bm|
  bm.report('integer ordered') do
    count_meetings((1..test_size).to_a, (1..test_size).to_a)
  end
end
Benchmark.bmbm do |bm|
  bm.report('array<integer> random') do
    count_meetings1(fd, ld)
  end
end
Benchmark.bmbm do |bm|
  bm.report('string random') do
    count_meetings2(fd, ld)
  end
end
Benchmark.bmbm do |bm|
  bm.report('integer random') do
    count_meetings(fd, ld)
  end
end
