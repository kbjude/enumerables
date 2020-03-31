module Enumerable
  def my_each
    arr = self
      for i in arr
        yield(i)
      end
  end
  ([1,2,3,4,5]).my_each {| i |}

  def my_each_with_index
    arr = self
      for i in arr
        v = arr.find_index(i)
        yield(i, v)
      end
  end
[1,2,3,4,5].my_each_with_index {| v, i | puts "#{i} => #{v}"}

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
def my_any(argument = nil)
    arr = self
    if block_given?
      arr.my_each do |i|
      yield(i)
      end
    else
      my_each { |i| return false if i.nil?}
    end
    true
    end
  end
  def my_any(argument = nil)
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
  end
  def my_any(argument = nil)
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
  end
  def my_all
    arr = self
    count = 0
    arr.my_each do |i|
        count +=1
    end
  end
end
end