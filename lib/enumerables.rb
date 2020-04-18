# enumerable methods

module Enumerable
  def my_each
    arr = self
    if block_given?
      for i in arr
        yield(i)
      end
    else
      arr.to_enum(:my_each)
    end
  end

  def my_each_with_index
    arr = self
    if block_given?
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
    elsif arr.my_each { |i| true if i == arg && i.class <= arg.class }
    else
      my_each { |i| return false unless i.is_a? arg }
    end
    true
  end

  def my_any?(arg = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
        return true if yield(i)
      end
    elsif arg.class == Regexp
      arr.my_each { |i| return true if i =~ arg }
    elsif arg.class != Class
      arr.my_each { |i| return true if i == arg && i.class == arg.class }
    else
      my_each { |i| return true if i.is_a? arg }
    end
    false
  end

  def my_none?(arg = nil)
    arr = self
    returned = true
    if block_given?
      arr.my_each do |i|
        return returned = false if yield i
      end
    elsif arg.class == Regexp
      arr.my_each { |i| returned = false if i =~ arg }
    elsif arr.my_each { |i| returned = false if i == arg && i.class <= arg.class }
    else
      my_each { |i| return returned = false if i.is_a? arg }
    end
    returned
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
    block1 = proc { |i| count += 1 if yield i }
    block2 = proc { |number| count += 1 if number == args }
    if args != nil
      arr.my_select{ |i| i == args }.my_each { count += 1}
      return count
    elsif block_given?
      arr.my_each(&block1)
    else
      arr.each(&block2) unless args.nil?
      my_each { count += 1 }
    end
    count
  end

  def my_inject(start = nil, arg = nil)
    arr = self
    if block_given? && arg.nil?
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
      result = nil
      if (start.class != Symbol && arg.nil?) && start.class == Integer
        warn "#{start} is not a symbol nor a string"
        abort
      elsif start.class == Symbol
        if start == :+
          result = arr.my_inject { |i , v| i + v }
        elsif start == :*
          result = arr.my_inject { |i , v| i * v }
        elsif start == :-
          result = arr.my_inject { |i , v| i - v }
        elsif start == :/
          result = arr.my_inject { |i , v| i / v }
        end
      elsif start.class == Integer && arg.class == Symbol
        new_arr = arr.clone
        new_arr.unshift(start)
        result = new_arr.my_inject(arg)
      end
    end
    result
  end

  def multiply_els
    arr = self
    arr.my_inject do |result, i|
      result = 1 if result.nil?
      result * i
    end
  end
  [1, 2, 3, 5].multiply_els
end
