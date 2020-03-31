module Enumerable
  def my_each
    arr = self
      for i in arr
        yield(i)
      end
  end

  def my_each_with_index
    arr = self
      for i in arr
        v = arr.find_index(i)
        yield(i, v)
      end
  end

def my_select
  arr = self
  result = []
  for i in arr
    if  yield i
      result.push(i)
      end
  end
  result
end
def my_all(argument = nil)
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
end
# def my_any(argument = nil)
#     arr = self
#     if block_given?
#       arr.my_each do |i|
#       yield(i)
#       end
#     else
#       my_each { |i| return false if i.nil?}
#     end
#     true
#     end
#   end
  def my_all(argument = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
      return false
      end
    else
      my_each { |i| yield i if i.nil? || i == false }
    end
    true
  end
  def my_none(argument = nil)
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
    mapped_arr =[]
      arr.my_each do |i| i
        mapped_arr.push(yield i)
        yield i
      end
      mapped_arr
  end
  def my_reject
    arr = self
    sum = 0
      arr.my_each do |i| i
        sum = sum + i
        sum(yield i)
      end
      sum
  end
  end
end
end