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
    sample = sample()
    tree = tree(sample)
    encode = encode_table(tree)
    decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, decode)
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

  def huffman_tree([{tree, _}]) do tree end
  def huffman_tree([{cha, fa},{chb, fb} | rest]) do
    huffman_tree(insert({{a, b}, fa + fb}, rest))
  end

# Build the encoding tree
  def encode_table(tree) do
    # To implement...
  end

  def decode_table(tree) do
    # To implement...
  end

  def encode(text, table) do
    # To implement...
  end

  def decode(seq, tree) do
    # To implement...
  end
end
