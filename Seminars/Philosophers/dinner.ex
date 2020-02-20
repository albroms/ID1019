defmodule Dinner do
  def start() do
    dinner = spawn(fn -> init() end)
    Process.register(dinner, :dinner)
  end

  def init() do
    seed = 1234
    c1 = Chopstick.start()
    c2 = Chopstick.start()
    c3 = Chopstick.start()
    c4 = Chopstick.start()
    c5 = Chopstick.start()
    ctrl = self() #control process
    Philosopher.start(5, 5, c1, c2, "Jinping", ctrl, seed + 1)
    Philosopher.start(5, 5, c2, c3, "Donald", ctrl, seed + 2)
    Philosopher.start(5, 5, c3, c4, "Vladimir", ctrl, seed + 3)
    Philosopher.start(5, 5, c4, c5, "Boris", ctrl, seed + 4)
    Philosopher.start(5, 5, c5, c1, "Shinzo", ctrl, seed + 5)
    wait(5, [c1, c2, c3, c4, c5])
  end

  defp wait(0, chopsticks) do
    Enum.each(chopsticks, fn(c) -> Chopstick.quit(c) end)
    Process.unregister(:dinner)
  end

  defp wait(n, chopsticks) do
    receive do
      :done ->
        wait(n-1, chopsticks)
      :abort ->
        # our kill switch
        :io.format("dinner aborted~")
        Process.exit(self(), :kill)
    end
  end
end
