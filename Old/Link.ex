defmodule Link do

  require Record

  Record.defrecord(:frame, data: nil)

  def start(master) do
    {:ok, spawn(fn() -> init(master) end)}
  end

  defp init(master) do
    receive do
      {:connect, dest} ->
        link(master, dest)
      :quit ->
        :ok
    end
  end

  def link(master, dest) do
    receive do
      {:send, msg} ->
        send(dest, frame(data: msg))
        link(master, dest)
        
      frame(data: msg) ->
        send(master, msg)
        link(master, dest)

      :quit ->
        :ok
    end
  end
  def test() do
    sender = spawn(fn() -> sender() end)
    receiver = spawn(fn() -> receiver() end)
    link 1 = Link.start(sender)
    link 2 = Link start(receiver)
    send(link1, {:connect, link2})
    send(link2, {:connect, link1})
    send(sender, {:connect, link1})
    send(receiver, {:connect, link2})
    :ok
  end
end
