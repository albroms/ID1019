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

  def exp(x, n) do
    case n do
      
    end
  end

end
