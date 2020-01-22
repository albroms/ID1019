defmodule Calculate do
  def eval({:int, n}) do n end
  def eval({:add, a, b}) do eval(a) + eval(b) end
  def eval({:sub, a, b}) do eval(a) - eval(b) end
  def eval({:mul, a, b}) do eval(a) * eval(b) end
  ## TODO: implement variables
end
