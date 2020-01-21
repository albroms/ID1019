defmodule BinaryEncoding do
  #first solution, int to binary
  def to_binary(0) do [0] end
  def to_binary(1) do [1] end
  def to_binary(n) do
    Lists.append(to_binary(div(n, 2)), [rem(n, 2)])
  end

  #better solution
  def to_better(n) do to_better(n, []) end
  def to_better(0, b) do b end
  def to_better(n, b) do
    to_better(div(n, 2), [rem(n, 2) | b])
  end

  #second task, binary to int
  def to_int(b) do to_int(b, 0) end
  def to_int([], sum) do sum end
  def to_int([head | rest], sum) do
    to_int(rest, 2 * sum + head)
  end
end
