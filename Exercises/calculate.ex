defmodule Calculate do

  def eval({:int, n}) do n end
  def eval({:add, a, b}) do eval(a) + eval(b) end
  def eval({:sub, a, b}) do eval(a) - eval(b) end
  def eval({:mul, a, b}) do eval(a) * eval(b) end
  #eval for variables
  def eval({:var, name}, bindings) do
    lookup(name, bindings)
  end
  def eval({type, {:var, a}, {:var, b}}, bindings) do
    eval({type,
          {:int, lookup(a, bindings)},
          {:int, lookup(b, bindings)}
         })
  end
  #lookup for value associated with variable
  def lookup(_var, []) do :not_found end
  def lookup(var, [{:bind, var, value} | _rest]) do
    value
  end
  def lookup(var, [_binding | rest]) do lookup(var, rest) end
end
