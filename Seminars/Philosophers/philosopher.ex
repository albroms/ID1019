defmodule Philosopher do

  @dream 10000
  @eat     500
  @delay  2000

  defp delay(t), do: sleep(t)

  defp sleep(0), do: :ok
  defp sleep(t), do: :timer.sleep(:rand.uniform(t))

  def start(hunger, strength, right, left, name, ctrl, seed) do
    IO.puts("#{name} sat at the table")
    delay(@delay)
    spawn_link(fn -> init(hunger, strength, right, left, name, ctrl, seed) end)
  end

  defp init(hunger, strength, right, left, name, ctrl, seed) do
    gui = Gui.start(name) #Each philosopher has a gui associated with it.
    :rand.seed(:exsplus, {seed, seed, seed})
    dreaming(hunger, strength, right, left, name, ctrl, gui)
  end

  #Dreaming state:
  defp dreaming(0, strength, _right, _left, name, ctrl, gui) do
    IO.puts("#{name} is happy, strength is still #{strength}!")
    send(gui, :stop)
    send(ctrl, :done)
  end

  defp dreaming(hunger, 0, _right, _left, name, ctrl, gui) do
    IO.puts("#{name} starved to death, hunger has reached #{hunger}")
    send(gui, :stop)
    send(ctrl, :done)
  end

  defp dreaming(hunger, strength, right, left, name, ctrl, gui) do
    IO.puts("#{name} is sleeping...")
    delay(@dream)
    IO.puts("#{name} woke up! Strength is at #{strength}.")
    waiting(hunger, strength, right, left, name, ctrl, gui)
  end


  #Waiting state:
  defp waiting(hunger, strength, right, left, name, ctrl, gui) do
    send(gui, :waiting)
    IO.puts("#{name} is waiting to eat. #{hunger} hunger to go")
    case Chopstick.request(right) do
      :ok ->
        IO.puts("#{name} took the right chopstick!")
        delay(@delay)
        case Chopstick.request(left) do
          :ok ->
            IO.puts("#{name} now has both chopsticks and can begin eating!")
            eating(hunger, strength, right, left, name, ctrl, gui)
            send(gui, :leave)
            dreaming(hunger, strength, right, left, name, ctrl, gui)
        end
    end
  end

  #Eating state:
  defp eating(hunger, strength, right, left, name, ctrl, gui) do
    send(gui, :enter)
    IO.puts("#{name} is eating...")

    delay(@eat)

    Chopstick.return(left)
    Chopstick.return(right)

    IO.puts("#{name} returned the chopsticks and fell asleep...")
    send(gui, :leave)
    dreaming(hunger-1, strength, right, left, name, ctrl, gui)
  end

end
