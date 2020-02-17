defmodule Wait do
  def hello do
    receive do
      x -> IO.puts("Ay! Sorpresa! Message: #{x}")
    end
  end
  
end
