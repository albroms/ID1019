defmodule HTTP do
  # Request = Request-Line                ; Section 5.1
  #           *(( general-header          ; Section 4.5
  #             | request-header          ; Section 5.3
  #             | entity-header ) CRLF)   ; Section 7.1
  #           CRLF
  #           [ message-body ]            ; Section 4.3

  def parse_request(r0) do
    #{request, r1} = request_line(String.to_charlist(r0)) # Use this if you receive a String from r0
    {request, r1} = request_line(r0) # Use this if you receive a charlist from r0
    {headers, r2} = headers(r1)
    {body, _}     = message_body(r2)
    {request, headers, body}
  end

  #Request-Line = Method SP Request-URI SP HTTP-Version CRLF

  def request_line([?G, ?E, ?T, 32 | r0]) do
    {uri, r1} = request_uri(r0)
    {ver, r2} = http_version(r1)
    [13, 10 | r3] = r2
    {{:get, uri, ver}, r3}
  end

  def request_uri([32 | r0]), do: {[], r0}

  def request_uri([c | r0]) do
    {rest, r1} = request_uri(r0)
    {[c | rest], r1}
  end

  #HTTP-Version

  def http_version([?H, ?T, ?T, ?P, ?/, ?1, ?., ?1 | r0]) do
    {:v11, r0}
  end

  def http_version([?H, ?T, ?T, ?P, ?/, ?1, ?., ?0 | r0]) do
    {:v10, r0}
  end

  # HEADERS

  def headers([13, 10 | r0]), do: {[], r0} # 13 is CR, 10 is LF

  def headers(r0) do
    {header, r1} = header(r0)
    {rest, r2}   = headers(r1)
    {[header | rest], r2}
  end

  def header([13, 10 | r0]), do: {[], r0}

  def header([c | r0]) do
    {rest, r1} = header(r0)
    {[c | rest], r1}
  end

  # BODY

  def message_body(r), do: {r, []}


  # Replies

  def ok(body) do
    "HTTP/1.1 200 OK\r\n\r\n #{body}"
  end

  def get(uri) do
    "GET #{uri} HTTP/1.1\r\n\r\n"
  end

end
