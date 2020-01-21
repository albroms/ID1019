defmodule Lists do
  # take the first item in a list
  def tak([h|t]) do
    cond do
      h == [] ->
        :no
      true ->
        {:ok, h}
    end
  end

  # remove the first item in the list
  def drp([h|t]) do
    cond do
      t == [] ->
        :no
      true ->
        {:ok, t}
    end
  end

  # return the number of elements in the given List
  def len([]) do 0 end
  def len([h|t]) do 1 + len(t) end

  # return the sum of the integer elements in the given list
  def sum([]) do 0 end
  def sum([h|t]) do h + sum(t) end

  #return a list where all elements are duplicated
  def duplicate([]) do [] end
  def duplicate([h|t]) do
    [h, h | duplicate(t)]
  end

  #add the element x to the list, but only if it isn't already in it.
  def add(x, []) do [x] end
  def add(x, [x|t]) do [x|t] end
  def add(x, [h|t]) do [h | add(x, t)] end

  #remove all occurrences of x in the list
  def remove(_x, []) do [] end
  def remove(x, [x|t]) do remove(x, t) end
  def remove(x, [h|t]) do [h | remove(x, t)] end

  #return a list of unique elements in a list
  def unique([]) do [] end
  def unique([elem | t]) do [elem | unique(remove(elem, t))] end

  #append one list to another
  def append([], l2) do l2 end
  def append([h1 | t1], l2) do [h1 | append(t1, l2)] end

  #a naive way to reverse the order of the items in a list
  def nreverse([]) do [] end
  def nreverse([h|t]) do append(nreverse(t), [h]) end

  #a better way to reverse a list
  def reverse(l) do reverse(l, []) end
  def reverse([], r) do r end
  def reverse([h|t], r) do reverse(t, [h | r]) end

  #benchmarking
  def dummy() do end #null operation
  def bench_reverse() do
    ls = [16, 32, 64, 128, 256, 512, 1024]
    n = 100
    # bench is a closure: a function with an environment.
    bench = fn(l) ->
      seq = Enum.to_list(1..l)
      td = time(n, fn -> dummy() end)
      tn = time(n, fn -> nreverse(seq) end)
      tr = time(n, fn -> reverse(seq) end)
      :io.format("length: ~10w dummy: ~8w us   nrev: ~8w us    rev: ~8w us~n", [l, td, tn, tr])
    end

    # We use the library function Enum.each that will call
    # bench(l) for each element l in ls
    Enum.each(ls, bench)
  end

  # Time the execution time of the a function.
  def time(n, call) do
    {t, _} = :timer.tc(fn -> loop(n, call) end)
    trunc(t/n)
  end

  # Apply the function n times.
  def loop(0, _) do :ok end
  def loop(n, call) do
    call.()
    loop(n-1, call)
  end
end
