defmodule Huffman do

  def sample do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
    no punctuation symbols the frequency will of course not
    represent english but it is probably not that far off'
  end

  def text()  do
    'this is something that we should encode'
  end

# Run all the steps of Huffman encoding and decoding.
  def test do
    text() |> tree()
    #sample = sample()
    #tree = tree(sample)
    #encode = encode_table(tree)
    #decode = decode_table(tree)
    #text = text()
    #seq = encode(text, encode)
    #decode(seq, decode)
  end

# Construct the Huffman tree from a text sample
  def tree(sample) do
    freq = freq(sample)
    huffman(freq)
  end

# Compute the frequencies of all the characters in the
# sample text and return a list of tuples {char, freq}.
  def freq(sample) do freq(sample, []) end
  def freq([], freq) do freq end
  def freq([char | rest], freq) do
    freq(rest, update(char, freq))
  end

  def update(char, []) do [{char, 1}] end
  def update(char, [{char, n} | freq]) do
    [{char, n + 1} | freq]
  end
  def update(char, [otherChar | freq]) do
    [otherChar | update(char, freq)]
  end

# Build the actual Huffman tree inserting one character
# at a time based on frequency.
  def huffman(freq) do
    sorted = Enum.sort(freq, fn({_, x}, {_, y}) -> x < y end)
    #building a huffman tree is made easier once the frequencies are sorted
    huffman_tree(sorted)
  end

  def huffman_tree([{tree, freq}]) do tree end
  def huffman_tree([{a, fa},{b, fb} | rest]) do
    huffman_tree(insert({{a, b}, fa + fb}, rest))
  end

  # insert tuples in the right order
  def insert({a, fa}, []) do [{a, fa}] end
  def insert({a, fa}, [{b, fb} | rest]) when fa < fb do
    [{a, fa}, {b, fb} | rest]
  end
  def insert({a, fa}, [{b, fb} | rest]) do
    [{b, fb} | insert({a, fa}, rest)]
  end

  def encode_table(tree) do
    ## TODO: create an encoding table
  end
  def decode_table(tree) do
    ## TODO: create a decoding table
  end
  def encode(text, table) do
    ## TODO: create function that converts from text to huffman sequence
  end
  def decode(seq, tree) do
    ## TODO: create function that converts a huffman sequene to ascii characters.
  end

end
