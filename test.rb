#!/bin/ruby
# frozen_string_literal: true

require './main'

p count_meetings([1], [3]) == 1
p count_meetings([1, 1], [1, 1]) == 1
p count_meetings([1, 256], [1, 256]) == 2
p count_meetings([1, 1, 1], [1, 1, 2]) == 2
p count_meetings([1, 2, 3, 1], [3, 3, 3, 4]) == 4
p count_meetings([1, 2, 3, 4], [3, 3, 3, 7]) == 4
p count_meetings([1, 1, 1, 1], [1, 1, 3, 3]) == 3
p count_meetings([3, 2, 3, 3], [3, 4, 5, 7]) == 4
p count_meetings([1, 2, 1, 2, 2], [3, 2, 1, 3, 3]) == 3
p count_meetings([3, 2, 3, 3, 4, 4, 4], [3, 4, 5, 7, 4, 4, 4]) == 5
p count_meetings([1, 1, 1, 1, 1, 1, 1, 1, 1, 1], [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]) == 10
p count_meetings([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]) == 10
p count_meetings([10, 20, 30, 40, 50, 60, 70, 80, 90, 100], [100, 100, 100, 100, 100, 100, 100, 100, 100, 100]) == 10
p count_meetings([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) == 10
p count_meetings((1..100_000).to_a, (1..100_000).to_a) == 100_000
p count_meetings([3, 2, 5, 1, 1], [5, 4, 5, 3, 4]) == 5
p count_meetings([1, 4, 1, 4, 2, 3, 3], [3, 4, 2, 4, 3, 4, 4]) == 4
