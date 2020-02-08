defmodule Brot do
  # Jeden Tag essen wir Brot.

  # z(n+1) = z^2(n) + c

  # given a complex number and maximum number of iterations,
  # return the value at which the absolute value of
  # c after i iterations is greater than 2, or 0 if it does not
  # for any i < m i.e. it should always return a value in the range.
  def mandelbrot(c, max) do
    z0 = Cmplx.new(0, 0)
    i = 0
    test(i, z0, c, max)
  end

  def next_z({zr, zi}, {cr, ci}) do
    sr = zr*zr - zi*zi + cr
    si = 2 * zr * zi + ci
    {sr, si}
  end

  def test(max, _curr, _c, max) do 0 end

  def test(i, z, c, max) do
    #zr2 = zr*zr
    #zi2 = zi*zi
    #a2 = zr2 + zi2

    if Cmplx.abs(z) > 2.0 do
      i
    else
      test(i+1, next_z(z, c), c, max) # Arithmetic error?
    end
  end

end
