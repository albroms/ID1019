defmodule Calculate do
  #var = {:var, name}

  def eval({:int, n}) do n end
  def eval({:add, a, b}) do eval(a) + eval(b) end
  def eval({:sub, a, b}) do eval(a) - eval(b) end
  def eval({:mul, a, b}) do eval(a) * eval(b) end
  ## TODO: implement variables
  def lookup(var, [{:bind, var, value} | _]) do value end
  def lookup(var, [_ | rest]) do lookup(var, rest) end
end
