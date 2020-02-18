defmodule Philosopher do

  @dream 1000
  @eat     50
  @delay  200

  def sleep(0) do :ok end
  def sleep(t) do
    :timer.sleep(:rand.uniform(t))
  end

  def start(hunger, strength, right, left, name, ctrl, seed) do
    #spawn a philosopher process
    spawn_link(fn -> init(hunger, strength, right, left, name, ctrl, seed) end)
  end

  defp init(hunger, strength, right, left, name, ctrl, seed) do
    gui = Gui.start(name)
    :rand.seed(:exsplus, {seed, seed, seed})
    dreaming(hunger, strength, right, left, name, ctrl, gui)
  end

  def dreaming do
    IO.puts("#{name} is dreaming.")
  end

  def waiting do
    IO.puts("#{name} is waiting. #{hunger} hunger to go")
  end

  def eating do
    IO.puts("#{name} is eating.")
  end

end
