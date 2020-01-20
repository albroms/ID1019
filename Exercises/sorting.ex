defmodule Sorting do
  #sorting exercises

##INSERTION SORT##

  #insert an element in its correct place in an ordered list
  def insert(elem, []) do [elem] end
  def insert(elem, [h|t]) do
    cond do
      elem > h ->
        [h | insert(elem, t)]
      true ->
        [elem, h | t]
    end
  end

  #the sorting function
  #def isort([]) do [] end
  def isort(list) do isort(list, []) end
  def isort([], sorted) do sorted end
  def isort([h|t], sorted) do isort(t, insert(h, sorted)) end

##MERGE SORT##

  #the sorting function
  def msort([]) do [] end
  def msort([elem]) do [elem] end
  def msort(list) do
    {l1, l2} = split(list, [], [])
    merge(msort(l1), msort(l2))
  end
  #split one list in two lists
  def split([], l1, l2) do {l1, l2} end
  def split([elem | t], l1, l2) do
    split(t, [elem | l2], l1)
  end

  #Merge two already sorted lists into one. It's probably a good idea to check
  #which head is larger to make sure you're merging them correctly.
  def merge([], l2) do l2 end
  def merge(l1, []) do l1 end
  #whichever element is smaller is put first in the merged list
  def merge([elem1 | l1], [elem2 | _] = l2) when elem1 < elem2 do
    [elem1 | merge(l1, l2)]
  end
  def merge(l1, [elem2 | l2]) do
    [elem2 | merge(l1, l2)]
  end

## QUICKSORT
  def qsort([]) do [] end
  def qsort([p | l]) do
  {list1, list2} = qsplit(p, l, [], [])
  small = qsort(list1)
  large = qsort(list2)
  Lists.append(small, [p | large])
  end


  def qsplit(_, [], small, large) do {small, large} end
  def qsplit(p, [h | t], small, large) do
    if h < p  do
      qsplit(p, t, [h | small], large)
    else
      qsplit(p, t, small, [h | large])
    end
  end
end
