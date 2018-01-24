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
    if m == 0 do
      0
    else
      n + product(m-1, n)
    end
  end

#Task 3, Recursion
  def exp(_, 0) do 1 end
  def exp(x, n) do
    product(exp(x, n-1), x)
  end

  def quickExp(x, 1) do x end
  def quickExp(x, n) do
    if rem(n, 2) == 0 do
      quickExp(x*x, div(n, 2))
    else
      x*quickExp(x, (n-1))
    end
  end

#Task 4, list operations
  def nth(n, l) do
    
  end
end
