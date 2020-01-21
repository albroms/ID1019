defmodule Queue do
#We want to implement a LIFO queue. We'll need two functions
  def new() do {:queue, [], []} end #Give us an empty queue!

  def add({queue, back, front}, elem) do #Add something to the Queue
    {:queue, [elem|back], front}
  end

  def remove({:queue, [], []}) do
    :fail
  end
  def remove({:queue, back, [elem|rest]})do
    {:ok, elem, {:queue, back, rest}}
  end
  #recursive case:
  def remove({:queue, back, []}) do
    remove({:queue, [], Enum.reverse(back)})
  end
end
