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

#Task 3, Recursion#

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

#a list concatenation function that illustrates how the ++ operator works
  def union([], y) do y end
  def union([head | tail], y) do
    [head|union(tail, y)]
  end
end
