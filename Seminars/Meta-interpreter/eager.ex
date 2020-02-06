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

  def eval_match({:var, id}, str, env) do
    case Env.lookup(id, env) do
      nil ->
        {:ok, Env.add(id, str, env)}
      #^str indicates we want to use an existing variable
      {_, ^str} ->
        {:ok, {id, str}}
      {_, _} ->
        :fail
    end
  end

 # eval_match({:cons, {:var, :x}, {:var, :x}}, {:cons, {:atm, :a} {:atm, :b}}, [])} should return :fail
  def eval_match({:cons, hp, tp}, {:cons, hstr, tstr}, env) do
    case eval_match(hp, hstr, env) do
      :fail ->
        :fail
      env ->
        case eval_match(tp, tstr, Env.remove({hp, hstr})) do
          :fail ->
            :fail
          env ->
            {:ok, {:cons, {hp, hstr}, {tp, tstr}}}
        end
    end
  end

end
