defmodule BinaryEncoding do
  def to_binary(0) do [0] end
  def to_binary(1) do [1] end
  def to_binary(n) do
    Lists.append(to_binary(div(n, 2)), [rem(n, 2)])
  end
end
