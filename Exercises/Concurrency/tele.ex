defmodule Tele do

  def start(msg) do
    agent = spawn_link(fn -> init() end)
    {:node, agent}
  end

  defp init(), do: answer()

  def answer(from) do
    receive do

    end
  end
end
