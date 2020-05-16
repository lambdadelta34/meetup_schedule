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

def prepare_schedules(first_day, last_day)
  investors_count = first_day.count
  schedules = []
  investors_count.times do |i|
    fday = first_day[i]
    lday = last_day[i]
    offset = (fday - 1)
    days_count = (lday - fday + 1)
    schedules << [offset, days_count]
  end
  schedules.sort_by { |i| [i.last, i.first] }
end

def solve(schedules)
  ceo_time = 0
  schedules.each do |schedule|
    offset, days_count = schedule
    offset_time = ceo_time >> offset
    time_length = offset_time.bit_length
    offset_time = if time_length > days_count
                    offset_time ^ (offset_time >> days_count + 1) << days_count + 1
                  else
                    offset_time
                  end
    free_ceo_day = (~offset_time & (offset_time + 1))
    next if free_ceo_day >= 2**days_count

    ceo_time = (ceo_time | free_ceo_day << offset)
  end
  ceo_time.to_s(2).count('1')
end

def solve1(schedules, calendar_size)
  ceo_time = Array.new(calendar_size) { 0 }
  schedules.each do |schedule|
    offset, days_count = schedule
    offset_time = ceo_time[offset...offset + days_count]
    free_ceo_day = offset_time.index(0)
    next if free_ceo_day.nil?

    ceo_time[free_ceo_day + offset] = 1
  end
  ceo_time.count(1)
end

def solve2(schedules, calendar_size)
  ceo_time = Array.new(calendar_size) { '0' }
  schedules.each do |schedule|
    offset, days_count = schedule
    offset_time = ceo_time[offset...offset + days_count]
    free_ceo_day = offset_time.index('0')
    next if free_ceo_day.nil?

    ceo_time[free_ceo_day + offset] = '1'
  end
  ceo_time.count('1')
end

def count_meetings(first_day, last_day)
  schedules = prepare_schedules(first_day, last_day)
  solve(schedules)
end

def count_meetings1(first_day, last_day)
  schedules = prepare_schedules(first_day, last_day)
  solve1(schedules, last_day.max)
end

def count_meetings2(first_day, last_day)
  schedules = prepare_schedules(first_day, last_day)
  solve2(schedules, last_day.max)
end

# fptr = File.open(ENV['OUTPUT_PATH'], 'w')

# first_day_count = gets.strip.to_i

# first_day = Array.new(first_day_count)

# first_day_count.times do |i|
#   first_day_item = gets.strip.to_i
#   first_day[i] = first_day_item
# end

# last_day_count = gets.strip.to_i

# last_day = Array.new(last_day_count)

# last_day_count.times do |i|
#   last_day_item = gets.strip.to_i
#   last_day[i] = last_day_item
# end

# result = count_meetings(first_day, last_day)

# fptr.write result
# fptr.write "\n"

# fptr.close
