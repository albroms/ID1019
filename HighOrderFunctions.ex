defmodule HighOrderFunctions do
  def split([c|rest]) do
    {s1, s2} = split(rest)
    {s2, [c|s1]}
  end

  def merge([], s2) do ... end
  def merge(s1, []) do ... end
  
end
