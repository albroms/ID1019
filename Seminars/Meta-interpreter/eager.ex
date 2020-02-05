defmodule Eager do
  @type atm :: {:atm, atom()}
  @type ignore :: :ignore

  # eval_expr/2 should take an expression and an environment and return
  # either {:ok, str} where str is a structure, or :error.

  # EVALUATE ATOMS
  def eval_expr({:atm, id}, env) do {:ok, id} end

  def eval_expr({:var, id}, env) do
    case Env.lookup(id, env) do
      nil ->
        :error
      {_, str} ->
        {:ok, str}
    end
  end

  # EVALUATE VARIABLES
  def eval_expr({:cons, ea, eb}, env) do
    case eval_expr(ea, env) do
      :error ->
        :error
      {:ok, ea} ->
        case eval_expr(eb, env) do
          :error ->
            :error
          {:ok, eb} ->
            {:ok, {ea, eb}}
        end
    end
  end

  # EVALUATE MATCHES
  def eval_match(:ignore, _, env) do
    {:ok, env}
  end

  def eval_match({:atm, id}, id, env) do
    {:ok, id}
  end

end
