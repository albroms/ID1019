defmodule Tic do

  def first do
    receive do
      {:tic, x} ->
        IO.puts("1 tic: #{x}")
        second()
    end
  end

  defp second do
    receive do
      {:tac, x} ->
        IO.puts("2 tac: #{x}")
        last()
      {:toe, x} ->
        IO.puts("2 toe: #{x}")
        last()
    end
  end

  defp last do
    receive do
      {t, x} ->
        IO.puts("3 end: #{t} #{x}")
    end
  end

end
