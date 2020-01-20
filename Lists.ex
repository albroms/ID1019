defmodule Listops do
#Task 4, list operations#

#return the nth element of a list using multiple clauses
  #def nth(0, [head | tail]) do head end
  #def nth(n, [_head | tail]) do nth(n-1, tail) end

  #nth element with 0 indexing.
  def nth(n, [head | tail]) do
    cond do
      n == 0 -> head
      true -> nth(n-1, tail)
    end
  end

#return the length of the list
  def len([]) do 0 end
  def len([ _ | tail]) do 1 + len(tail) end

#return the sum of the lists elements.
#basically works like a len function where we care about
#the value of the head.
  def sum([]) do 0 end
  def sum([head | tail]) do head + sum(tail) end

#return a list based off the list provided where all elements are duplicated
  def duplicate([]) do [] end
  def duplicate([head | tail]) do
    [head, head | duplicate(tail)]
  end

#add the given value to the given list and insert it into the list if it does not already exist
  def add(x, []) do [x] end #for an empty list
  def add(x, [x | tail]) do [x | tail] end #if x is already in the list
  def add(x, [head | tail]) do
    [head | add(x, tail)] #all other cases
  end

#remove the specified value from the given list
  def remove(_, []) do [] end
  def remove(x, [x | tail]) do remove(x, tail) end
  def remove(x, [head | tail]) do
    [head | remove(x, tail)]
  end

#return a list of all the unique elements in the provided list
  def unique([]) do [] end
  def unique([head|tail]) do
    l = remove(head, tail)
    [head|unique(l)]
  end

#return a list containing lists of equal elements
  def pack([]) do [] end
  def pack([x|tail]) do
    {all, rest} = match(x, tail, [x], [])
    [all | pack(rest)]
  end

#reverse a list in quadratic time
#the recursion call is done in linear time, but so is the concatination.
  def slow_reverse([]) do [] end
  def slow_reverse([head | tail]) do
    reverse(tail) ++ [head] #using the included concatinator
  end
#a better reverse function that runs in linear time
  def reverse(l) do reverse(l, []) end
  def reverse([], rev) do rev end
  def reverse([head | tail], rev) do
    reverse(tail, [head|rev])
  end
end
