defmodule Sorting do

# I N S E R T I O N   S O R T #
  #the base of the sorting algorithm
  def isort(list) do isort(list, []) end
  #first argument is the unsorted segment of the list
  #second argument is the sorted segment of the list
  def isort([], sorted) do sorted end
  def isort([head|tail], sorted) do
    isort(tail, insert(head, sorted))
  end
  #the part of the algorithm that handles the insertions
  def insert(x, []) do [x] end
  #for situations where the head is smaller than x.
  def insert(x, [smaller|tail]) when x > smaller do
      [smaller|insert(x, tail)]
      #the recursive call makes sure the tail is also in order
  end
  #for situations where head is bigger than x.
  def insert(x, bigger) do
    [x|bigger]
  end
# M E R G E   S O R T #
  def msort([]) do [] end
  def msort([x]) do [x] end
  def msort(l) do
    {l1, l2} = split(l, [], [])
    merge(msort(l1), msort(l2))
  end

  #splitter functions
  def split([], l1, l2) do {l1, l2} end
  def split([x|tail], l1, l2) do
    
  end
end
