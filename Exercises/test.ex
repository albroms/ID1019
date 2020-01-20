defmodule Test do
  # compute the double of a number
  def double(x) do
    2 * x
  end
  # convert from Fahrenheit to Celsius
  def fToC(f) do
    c = (f-32)/1.8
  end

  def cToF(c) do
    f = c*1.8 + 32
  end

  def rectangleArea(a, b) do
    a * b
  end

  def square(s) do rectangleArea(s, s) end

  def circleArea(r) do
    square(r) * :math.pi()
  end
end
