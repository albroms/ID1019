defmodule Memory do
  # the key is a tuple {m, t}, defining the remaining resources (the point in the mxt space)
  # the value is the number of hinges and latches and best profit possible at this point {h, l, p}
  # The functions we should implement are new(), store(k, v, mem), lookup(k, mem)

  def new() do [] end

  def store(k, v, mem) do
    [{k, v} | mem]
  end

  def lookup(_, []) do nil end
  def lookup(k, [{k, v}|_]) do v end
  def lookup(k, [_|rest]) do lookup(k, rest) end
  
end
