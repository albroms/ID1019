defmodule Color do
  # export function
  # given a depth on a scale from 0 to max, give us a color.
  def convert(depth, max) do
    #red(depth, max)
    #blue(depth, max)
    #green_cool(depth, max)
    #green_warm(depth, max)
    inverted(depth, max)
  end

  def red(d, max) do
    #from red to blue
    f = d / max

    # a is from 0 to 4
    a = f * 4

    # x should be 0..4
    x = trunc(a)

    # y should be 0..255
    y = trunc(255 * (a-x) )

    case x do
      0 ->
        {:rgb, y, 0, 0} #black -> red
      1 ->
        {:rgb, 255, y, 0} #red -> yellow
      2 ->
        {:rgb, 255-y, 255, 0} #yellow -> green
      3 ->
        {:rgb, 0, 255, y} #green -> cyan
      4 ->
        {:rgb, 0, 255-y, 255} #cyan -> blue
    end
  end

  def blue(d, max) do
    #from blue to red

    f = d / max
    a = f * 4
    x = trunc(a)
    y = trunc(255 * (a - x) )

    case x do
      0 ->
        {:rgb, 0, 0, y} #black -> blue
      1 ->
        {:rgb, 0, y, 255} #blue -> cyan
      2 ->
        {:rgb, 0, 255, 255-y} #cyan -> green
      3 ->
        {:rgb, y, 255, 0} #green -> yellow
      4 ->
        {:rgb, 255, 255-y, 0} #yellow -> red
    end
  end

  def green_warm(d, max) do
    f = d / max
    a = f * 4
    x = trunc(a)
    y = trunc(255 * (a-x) )

    case x do
      0 ->
        {:rgb, 0, y, 0} #black -> green
      1 ->
        {:rgb, y, 255, 0} #green -> yellow
      2 ->
        {:rgb, 255, 255-y, 0} #yellow -> red
      3 ->
        {:rgb, 255-y, 0, y} #red -> purple
      4 ->
        {:rgb, 0, y, 255-y} #purple -> blue
    end
  end

  def green_cool(d, max) do
    f = d / max
    a = f * 4
    x = trunc(a)
    y = trunc(255 * (a-x) )

    case x do
      0 ->
        {:rgb, 0, y, 0} #black -> green
      1 ->
        {:rgb, 0, 255, y} #green -> cyan
      2 ->
        {:rgb, 0, 255-y, 255} #cyan -> blue
      3 ->
        {:rgb, y, 0, 255} #blue -> purple
      4 ->
        {:rgb, 255, 0, 255-y} #purple -> red
    end
  end

  def inverted(d, max) do
    f = d / max
    a = f * 4
    x = trunc(a)
    y = trunc(255 * (a-x) )

    case x do
      0 ->
        {:rgb, 255, 255, 255-y} # white -> yellow
      1 ->
        {:rgb, 255, 255-y, 0} #yellow -> red
      2 ->
        {:rgb, 255, 0, y} #red -> purple
      3 ->
        {:rgb, 255-y, 0, 255} #purple -> blue
      4 ->
        {:rgb, 0, y, 255-y} #blue -> cyan
    end
  end

end
