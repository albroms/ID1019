defmodule Recursion do

  def mul(0, _) do 0 end
  def mul(m, n) do
    cond do
      m<0 && n<0 ->
        mul(0-m, 0-n)
      m>0 && n<0 ->
        -mul(m, 0-n)
      m<0 && n>0 ->
        -mul(0-m, n)
      true ->
        n + mul(m-1, n)
    end
  end

  def power(0, _) do 0 end
  def power(_, 0) do 1 end
  def power(b, e) do
    mul(b, power(b, e-1))
  end

  def qpower(0, _) do 0 end
  def qpower(_, 0) do 1 end
  def qpower(b, e) do
    case rem(e, 2) do
      0 ->
        e = qpower(b, div(e, 2))
        e * e
      1 ->
        b * qpower(b, e-1)
    end
  end

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do
    fib(n-1) + fib(n-2)
  end

  def ackermann(0, n) do n + 1 end
  def ackermann(m, 0) do ackermann(m-1, 1) end
  def ackermann(m, n) do
    cond do
      m < 0 ->
        :err
      n < 0 ->
        :err
      true ->
        ackermann(m-1, ackermann(m, n-1))
    end
  end

end
