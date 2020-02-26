defmodule Rudy do



  @doc """
    initialize the server, take a port number,
    open a listening socket and pass the socket
    to handler/1. Once handled, close the socket.
  """
  def start(port) do
    Process.register(spawn(fn -> init(port) end), :rudy)
  end
  def stop() do
    Process.exit(Process.whereis(:rudy), "Time to die!")
  end

  def init(port) do
    opt = [:list, active: false, reuseaddr: true]

    case :gen_tcp.listen(port, opt) do
      {:ok, listen} ->
        handler(listen) #TODO: pass the socket to handler
        :gen_tcp.close(listen)
        :ok
      {:error, error} ->
        error
    end
  end

  @doc """
    listen to the socket for an incoming connection.
    Once a client has connected it will pass the connection
    to request/1.
    When the request is handled the connection is closed.
  """
  def handler(listen) do
    case :gen_tcp.accept(listen) do
      {:ok, client} ->
        request(client) #TODO: pass the connection to request/1
        handler(listen) #listen for another request
      {:error, error} ->
        error
    end
  end

  @doc """
    Read the request from the client and parse it.
    It will parse the request using the HTTP parser
    and pass the request to reply/1.
    The reply is then sent back to the client.
  """
  def request(client) do
    recv = :gen_tcp.recv(client, 0)
    case recv do
      {:ok, str} ->
        req = HTTP.parse_request(str) #TODO: parse request using HTTP module
        IO.puts(inspect(req))
        response = Rudy.reply(req) #TODO: pass request to reply/1
        :gen_tcp.send(client, response)
      {:error, error} ->
        IO.puts("RUDY ERROR: #{error}")
    end
    :gen_tcp.close(client)
  end

  # How should we reply? How can we make a well formatted reply?
  def reply({{:get, uri, _}, _, _}) do
    :timer.sleep(10)
    HTTP.ok("<h1>What the fuck did you just fucking say about me, you little bitch? I'll have you know I graduated top of my class in the Navy SEALs, and I've been involved in numerous secret raids on Al-Quaeda, and I have over 300 confirmed kills. I am trained in gorilla warfare and I'm the top sniper in the entire US armed forces. You are nothing to me but just another target. I will wipe you the fuck out with precision the likes of which has never been seen before on this Earth, mark my fucking words. You think you can get away with saying that shit to me over the Internet? Think again, fucker. As we speak I am contacting my secret network of spies across the USA and your IP is being traced right now so you better prepare for the storm, maggot. The storm that wipes out the pathetic little thing you call your life. You're fucking dead, kid. I can be anywhere, anytime, and I can kill you in over seven hundred ways, and that's just with my bare hands. Not only am I extensively trained in unarmed combat, but I have access to the entire arsenal of the United States Marine Corps and I will use it to its full extent to wipe your miserable ass off the face of the continent, you little shit.\n If only you could have known what unholy retribution your little 'clever' comment was about to bring down upon you, maybe you would have held your fucking tongue. But you couldn't, you didn't, and now you're paying the price, you goddamn idiot. I will shit fury all over you and you will drown in it. You're fucking dead, kiddo.</h1>"
    )
  end

end
