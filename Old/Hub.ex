defmodule Hub do
  require Link

  def start() do
    {:ok, spawn(fn() -> init() end)}
  end

  def init() do
    :io.format("hub ~w: started~n", [self()])
    hub([])
  end

  def hub(connected) do
    receive do
      {:connect, pid} ->
        :io.format()
        ref = :erlang.monitor(:process, pid)
        hub([{ref, pid}|connected])
      {:disconnect, pid} ->
        :io.format("hub ~w: disconnect ~w~n", [self(), pid])
        :erlang.demonitor(connected, pid)
        hub(List.keydelete(connected, pid, l))

      frame() = frm ->
        Enum.each(connected, fn(pid) -> send(pid, frm) end)
        hub(connected)

      :quit ->
        :ok
    end
end
