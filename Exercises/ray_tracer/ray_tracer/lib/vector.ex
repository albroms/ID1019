defmodule Vector do
  # Scalar multiplication
  def smul({x1, x2, x3}, s) do
    {x1 * s, x2 * s, x3 * s}
  end

  # Addition and subtraction
  def sub({x1, x2, x3}, {y1, y2, y3})do
    {x1 - y1, x2 - y2, x3 - y3}
  end
  def add({x1, x2, x3}, {y1, y2, y3}) do
    {x1 + y1, x2 + y2, x3 + y3}
  end

  # Dot product
  def dot({x1, x2, x3}, {y1, y2, y3}) do
    x1*y1 + x2*y2 + x3*y3
  end

  # Scaling a vector x to a specified length l
  def scale(x, l) do
    n = norm(x)
    # THIS WILL CRASH IF n == 0 !
    smul(x, l / n)
  end

  # Normalize by scaling to norm 1
  def normalize(x) do
    scale(x, 1)
  end

  # Square of a vector
  def sq(x) do
    dot(x, x)
  end

  # The norm (length) of a vector
  def norm({x1, x2, x3}) do
    :math.sqrt(x1 * x1+x2 * x2+x3 * x3)
  end

  # Cross product, used to find a vector that is orthogonal to
  # both x and y
end
