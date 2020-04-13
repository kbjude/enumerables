# frozen_string_literal: true

# enumerable methods
module Enumerable
  def my_each
    arr = self
    if block_given?
      for i in arr
        yield(i)
        puts i
      end
    else
      arr.to_enum(:my_each)
    end
  end

  def my_each_with_index
    arr = self
    if block_give?
      arr.my_each do |i|
        v = arr.find_index(i)
        yield(i, v)
      end
    else
      arr.to_enum(:my_each_with_index)
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

  def my_all?(arg = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
        return false unless yield(i)
      end
    else
      my_each { |i| return false if !i.is_a? arg }
    end
    true
  end
  def my_any?( arg = nil )
    arr = self
    if block_given?
      arr.my_each do |i| 
        return true if yield(i)
      end
    else
      my_each { |i| return true if i.is_a? arg }
    end
    false
  end

  def my_none?( arg = nil )
    arr = self
    if block_given?
      arr.my_each do |i|
        return false if yield i
      end
    else
      my_each { |i| return false if i.is_a? arg }
    end
    true
  end

  def my_map
    arr = self
    if block_given?
      mapped_arr = []
      arr.my_each do |i|
        mapped_arr.push(yield i)
        yield i
        end
      mapped_arr
    else
      arr.to_enum(:my_map)
    end
  end

  def my_count(args = nil)
    arr = self
    count = 0
    if args != nil
      my_each { |i| count += 1 if i == args }
      return count
    end
    if block_give?
      arr.my_each do |i|
      count +=i
      if yield(i)
      end
    else
      my_each {count +=1}
    end
    count
  end
  [12,3,4,6].my_count{|i| puts i}

  def my_inject(result = nil)
    arr = self
    arr.my_each do |i, v|
      result = yield(result, i)
    end
    result
  end

  def multiply_els
    arr = self
    arr.my_inject do |result, i|
      if result.nil?
        result = 1
      end
      result * i
    end
  end
[1, 2, 3, 5].multiply_els
end