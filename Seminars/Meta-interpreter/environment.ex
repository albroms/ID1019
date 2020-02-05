defmodule Env do
  # To make things easy we'll implement our environments as
  # lists of key-value tuples.

  def new() do
    # return an empty environment
    []
  end

  ## ADDING VARIABLE BINDINGS TO ENVIRONMENT
  def add(id, str, env) do
    # return an environment where the binding of the variable "id"
    # to the structure "str" has been added to the environment "env"
    [{id, str} | env]
  end

  ## FINDING VARIABLE BINDINGS IN AN ENVIRONMENT
  def lookup(id, env) do
    List.keyfind(env, id, 0)
  end

  ## REMOVING VARIABLE BINDINGS FROM AN ENVIRONMENT
  def remove(ids, env) do
    # returns an environment where all bindings for variables in list
    # "ids" have been removed
    List.foldr(ids, env, fn(id, env) ->
      List.keydelete(env, id, 0)
    end)
  end
end
