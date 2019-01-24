defmodule LectureTrees do
#Compound data structures in Elixir:
#tuples: {:student, "Sune Mangs", :cinte, 2012, :sunem}
#lists: [:sunem, :joed, :sueb, :anng]
#lists in elixir are basically like linked lists where the head can be seen as
#whatever value a node in our list has, and the tail is a reference to the rest of the list.
#We could implement lists using tuples:
  <list> ::= nil | '{' :cons ',' <expression> ',' <list> '}'
#[:foo, :bar, :zot]
#[:foo | [:bar|[:zot|[]] ] ] The representation above means the same thing but
#is syntactic sugar, making it easier to read and write.
#{:cons, :foo, {:cons, :bar, {:cons, :zot, :nil}}} <- this is what we would have to use if we didn't have the list representation in Elixir.
#Lists give us a convenient syntax... once we get used to it.
#Lists are handled more efficiently by the compiler and run-time system.
#Important to understand when to use lists and when to use tuples.
#Adding a new element to the beginning of a tuple means creating a new tuple where you have the desired element in the first position
#and the old tuple behind it. This operation is unfortunately not constant, but linear O(n).

#Return the n'th element from a list of three:
  def nth_l(1, [r|_]) do r end
  def nth_l(2, [_|[r|_]] do r end
  def nth_l(3, [_|[_|[r|_] ]]) do r end
#Return the n'th element from a tuple of three:
  def nth_t(1, {r, _, _}) do r end
  def nth_t(2, {_, r, _}) do r end
  def nth_t(3, {_, _, r}) do r end
#there is no real syntax to show the first element of a tuple for example.
#we'd have to write it as {x, _, _} and then request x.

#elem(tuple, n): return the n'th element in the tuple (zero indexed)
#Enum.at(list, n): return the n'th element of the list (zero indexed)

#When benchmarking, try and figure out how much time it takes to do nothing.
#Once you know that, you know whether or not you can optimize certain functions to run faster.
#dummy (do nothing): constant time, approx. 20ms
#explicit tuple: constant time, approx. 20ms

#Why use lists:
#Represent the following information using either a list or a tuple.
#A playing card: tuple {:clubs, 3} or {:card, :hearts, 10}
#A stack/deck of playing cards: list
#1001 movies to watch before you die: a bit ambiguous, but a tuple may be best
#A list of a million things to do, in order: list

#Trees z = {:node, 40, {:leaf, 42}, {:leaf, 39}}
#      t = {:node, 38, z, {:leaf, 34}}
#Search a tree:
#Given a tree, implement a function that searches for a given nmber, returning
#:yes or :no depending on if the number is in the tree or not.
  def member(_, :nil) do :no end
  def member(n, {:leaf, ...}) do :yes end
  def member(_, {:leaf, ...}) do :no end
  def member(n, {:node, ..., ..., ...,}) do :yes end
  #unordered tree
  def member(n, {:node, _, left, right}) do
    case ... do
      :yes -> :yes
      :no -> ...
    end
  end
  #ordered tree
  #key-value look-up
  #Assume that we have an ordered tree of key-value pairs.
  #t = {:node, :k, 38,
  #            {:node, :b, 34, :nil, :nil},
  #            {:node, :o, 64, :nil, :nil}}

end
