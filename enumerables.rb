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
  for i in arr
      if i > 2
      yield i
      end
  end
end
[3,4,1,8,4,2,5].my_select  { |i| puts i}
end