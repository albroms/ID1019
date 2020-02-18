defmodule Chopstick do

  def start() do
    chopstick = spawn_link(fn -> init() end)
    {:chopstick, chopstick}
  end

  defp init(), do: available()

  defp available() do
    receive do
      #send chopstick to philosopher
      {:request, from} ->
        send(from, :granted)
        gone()
      :quit -> :ok
    end
  end

  defp gone() do
    receive do
      :return -> available()
      :quit -> :ok
    end
  end

  #a synchronous request handling
  def request({:chopstick, pid}) do
    send(pid, {:request, self()})
    receive do
      :granted -> :ok
    end
  end

  def return({:chopstick, pid}) do
    send(pid, :return)
  end

  def quit({:chopstick, pid}) do
    send(pid, :quit)
  end

end
