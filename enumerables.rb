# frozen_string_literal: true

# enumerable methods
module Enumerable
  def my_each
    arr = self
    arr.each do |i|
      yield(i)
    end
  end

  def my_each_with_index
    arr = self
    arr.each do |i|
      v = arr.find_index(i)
      yield(i, v)
    end
  end

  def my_select
    arr = self
    result = []
    arr.each do |i|
      result.push(i) if yield i
    end
    result
  end

  def my_all(_argument = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
        return false unless yield(i)
      end
    else
      my_each { |i| return false if i.nil? || i == false }
    end
    true
  end

  def my_any(_argument = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
        yield(i)
      end
    else
      my_each { |i| return false if i.nil? }
    end
    true
  end

  def my_none(_argument = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
        return false if yield i
      end
    else
      my_each { |i| yield i if i.nil? && i == false }
    end
    true
  end

  def my_map
    arr = self
    mapped_arr = []
    arr.my_each do |i|
      mapped_arr.push(yield i)
      yield i
    end
    mapped_arr
  end

  def my_inject
    arr = self
    result = 0
    arr.my_each do |i|
      result = yield(result, i)
    end
    result
  end

  def multiply_els
    arr = self
    arr.my_inject { |result, i| result + i }
  end
end
[1, 2, 3, 5].multiply_els
