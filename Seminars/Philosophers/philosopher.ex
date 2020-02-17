defmodule Philosopher do

  def sleep(0) do :ok end
  def sleep(t) do
    :timer.sleep(:rand.uniform(t))
  end

  def start(hunger, strength, right, left, name, ctrl, seed) do
    #spawn a philosopher process
    spawn_link(a_philosopher)
  end

end
