#!/bin/ruby
# frozen_string_literal: true

require 'json'
require 'stringio'

#
# Complete the 'count_meetings' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY first_day
#  2. INTEGER_ARRAY last_day
#

def count_meetings(first_day, last_day)
  # Write your code here
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

first_day_count = gets.strip.to_i

first_day = Array.new(first_day_count)

first_day_count.times do |i|
  first_day_item = gets.strip.to_i
  first_day[i] = first_day_item
end

last_day_count = gets.strip.to_i

last_day = Array.new(last_day_count)

last_day_count.times do |i|
  last_day_item = gets.strip.to_i
  last_day[i] = last_day_item
end

result = count_meetings(first_day, last_day)

fptr.write result
fptr.write "\n"

fptr.close
