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
    if block_given?
      arr.my_each do |i, p|
        v = arr.find_index(i)
        yield(i, v)
      end
    else
      arr.to_enum(:my_each_with_index)
    end
  end

  def my_select
    arr = self
    if block_given?
      result = []
      arr.my_each do |i|
        result.push(i) if yield i
      end
    else
      arr.to_enum(:my_select)
    end
    result
  end

  def my_all?(arg = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
        return false unless yield(i)
      end
    elsif arg.class == Regexp
      arr.my_each { |i| true if i =~ arg }
    elsif
      arr.my_each { |i| true if i == arg && i.class <= arg.class }
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
    elsif arg.class == Regexp
      arr.my_each { |i| true if i =~ arg }
    elsif
      arr.my_each { |i| true if i == arg && i.class <= arg.class }
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
    elsif arg.class == Regexp
      arr.my_each { |i| false if i =~ arg }
    elsif
      arr.my_each { |i| false if i == arg && i.class <= arg.class }
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
      puts "First test"
      arr.my_select{|i| i == args}.my_each{ | i | count += 1}
      puts "second"
      return count
    elsif block_given?
      arr.my_each do |i|
      result = count += 1
      yield(result)
      end
    else
      my_each {count +=1}
    end
    count
  end

  def my_inject(start = nil, arg = nil)
    arr = self
  if arg == nil? && block_given?
    result = start
    arr.my_each do |i|
      result = 
      if result.nil?
          i
        else
        yield(result, i)
      end
    end
  else
    if (start.class != Symbol && arg.nil?) && start.class == Integer
      warn "The value #{start} is not a symbol rep"
      abort
    elsif start.class == Symbol
      if start == :+
        result = arr.my_inject { |i, v| i + v }
      elsif start == :*
        result = arr.my_inject { |i, v| i * v }
      elsif start == :-
        result = arr.my_inject { |i, v| i - v }
      elsif start == :/
        result = arr.my_inject { |i, v| i / v }
      end
    elsif start.class == Integer && arg.class == Symbol
      new_arr = arr.to_a
      new_arr.unshift(start)
      result = new_arr.my_inject(arg)
    end
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