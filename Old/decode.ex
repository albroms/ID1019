defmodule Decode do
  # tuple = {:char, frequency}
  # turn a list of tuples into a list of atoms with their corresponding frequency
  # e.g. decoding [{:a, 2}, {:b, 3}, {:c, 1}] gives us [:a, :a, :b, :b, :b, :c]
  def decode([]) do [] end
  def decode([h|t]) do [takeout(h)|decode(t)] end

  def takeout({char, n}) do takeout(char, n, i) end
  
end
