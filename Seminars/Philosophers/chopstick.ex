defmodule Chopstick do

  def start() do
    chopstick_id = spawn_link(fn -> init() end)
    {:chopstick, chopstick}
  end

  def available() do
    receive do
      #send chopstick to philosopher
      ... -> ... #send to philosopher: chopstick
      :quit -> :ok
    end
  end

  def gone() do
    receive do
      #tell philosopher to wait
      ... -> ...
      :quit -> :ok
    end
  end

  def request({:chopstick, pid}) do
    send(pid, {:request, self()})
    receive do
      ... -> :ok
    end
  end

end
