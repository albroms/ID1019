defmodule Frenchcards do

  @spec sort([card]) :: [card]
  @spec split([card]) :: {[card], [card]}

  # NOTE: neither the compiler or the interpreter cares what @type is.
  # Type tags are mainly for the programmer's convenience.
  @type suit :: :spades | :hearts | :diamonds | :clubs
  @type value :: 2..14
  @type card :: {:card, suit, value}

  # Suit hierarchy: clubs < diamond < hearts < spades
  def lt({:card, s, v1}, {:card, s, v2}) do v1 < v2 end
  def lt({:card, :clubs, v1}, {:card, :hearts}) do true end
  def lt({:card, :hearts, v1}, {:card, :diamonds, v2}) do true end
  #et cetera

  def gt({:card, s, v1}, {:card, s, v2}) do v1 > v2 end



end
