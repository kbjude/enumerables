module Enumerable
    def my_each
        yield(x)
    end
[1,2,3,4,5].find_all {| x | x}
end