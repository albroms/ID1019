defmodule Btree do
  #@type tree :: :nil | {:leaf, value} | {:node, value, left, right}
  #@type  kvtree :: :nil | {:node, key, value, left, right} <=> key is an integer

  ## member(elem, tree) checks if elem is in tree
  def member(_e, :nil) do :no end
  def member(e, {:leaf, e}) do :yes end
  def member(_e, {:leaf, _not_e}) do :no end
  def member(e, {:node, e, _left, _right}) do :yes end
  def member(e, {:node, v, left, _right}) when e < v do
    member(e, left)
  end
  def member(e, {:node, _v, _left, right}) do
    member(e, right)
  end

  ## insert(elem, tree) inserts elem in tree
  def insert(e, :nil) do {:leaf, e} end
  def insert(e, {:leaf, v}) when e < v do
    {:node, v, insert(e, left), :nil}
  end
  def insert(e, {:leaf, v}) do
    {:node, v, :nil, insert(e, right)}
  end
  def insert(e, {:node, v, left, right }) when e < v do
    {:node, v, insert(e, left), right}
  end
  def insert(e, {:node, v, left, right })  do
    {:node, v, left, insert(e, right)}
  end

  ## delete(elem, tree) removes elem from tree
  def delete(e, {:leaf, e}) do :nil end
  def delete(e, {:node, e, :nil, right}) do right end
  def delete(e, {:node, e, left, :nil}) do left end
  def delete(e, {node, e, left, right}) do
    {:node, rightmost(left), delete(rightmost(left), left), right}
  end
  def delete(e, {node, v, left, right}) when e < v do
    {:node, v, delete(e, left), right}
  end
  def delete(e, {node, v, left, right}) do
    {:node, v, left, delete(e, right)}
  end

  # rightmost is a helper function to make the delete function behave properly
  # it picks out the element furthest to the right in a tree.
  def rightmost({:leaf, e}) do e end
  def rightmost({:node, v, _, :nil}) do v end
  def rightmost({:node, _, _, right}) do rightmost(right) end


end
