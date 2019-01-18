defmodule M do
  def main do
    do_stuff()
  end

  def do_stuff do
    list1 = [1,2,3]
    list2 = [4,5,6]

    list3 = list1 ++ list2

    list4 = list3 -- list1

    IO.puts 6 in list4

    [head|tail] = list3
    IO.puts "Head : #{head}"

    IO.write "Tail : #{tail}"
    IO.inspect tail

  end

#Task 2, A first program
  def circArea(r) do
    IO.puts r*r*:math.pi
  end

  def product(m, n) do
    cond do
      m == 0 -> 0
      true -> n + product(m-1, n)
    end
  end

#Task 3, Recursion

  #Please don't use this, it's EXTREMELY slow!
  def exp(x, n) do
    case n do
      0 -> 1
      1 -> x
      _ -> product(exp(x, n-1), x)
    end
  end

  #Use this one to your heart's content!
  def quickExp(x, n) do
    cond do
      n == 1 -> x
      rem(n, 2) == 0 -> quickExp(x*x, div(n, 2))
      true -> x*quickExp(x, (n-1))
    end
  end

#Task 4, list operations

#return the nth element of a list
  #def nth(0, [head | tail]) do head end
  #def nth(n, [_head | tail]) do nth(n-1, tail) end

  #nth element with 0 indexing.
  def nth(n, [head | tail]) do
    cond do
      n == 0 -> head
      true -> nth(n-1, tail)
    end
  end

#return the length of the list
  def len([]) do 0 end
  def len([_head | tail]) do 1 + len(tail) end

#return the sum of the lists elements
  def sum([]) do 0 end
  def sum([head | tail]) do head + sum(tail) end

#return a list based off the list provided where all elements are duplicated
  def duplicate([]) do [] end
  def duplicate([head | tail]) do
    [head, head | duplicate(tail)]
  end

#add the given value to the given list and insert it into the list if it does not already exist
  def add(x, []) do [x] end #for an empty list
  def add(x, [x | tail]) do [x | tail] end #if x is already in the list
  def add(x, [head | tail]) do [head | add(x, tail)] end #for other cases

#remove the specified value from the given list
  def remove(_, []) do [] end
  def remove(x, [x | tail]) do remove(x, tail) end
  def remove(x, [head | tail]) do
    [head | remove(x, tail)]
  end

#return a list of all the unique elements in the provided list
  def unique([]) do [] end
  def unique([head | tail]) do
    [head|unique(remove(head, tail))]
  end
#return a list containing lists of equal elements
  def pack([]) do [] end
  def pack([head | tail]) do

  end

end
