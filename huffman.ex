defmodule Huffman do

  # a leaf is represented as a character and its frequency
  # each node is a simple tuple with two branches {left, right}

  def sample do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
  no punctuation symbols the frequency will of course not
  represent english but it is probably not that far off'
  end

  def text, do: 'this is something that we should encode'

  def test do
    sample = sample()
    tree = tree()
    encode = encode_table(tree)
    decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, decode)
  end

  def tree(sample) do
    freq = freq(sample)
    huffman(freq)
  end

  def freq(sample) do
    freq(sample, ...)
  end
  def freq([], freq) do
    ...
  end

  def freq([char | rest], freq) do
    freq(rest, ...)
  end

  def encode_table(tree) do
    #stuff
  end

  def decode_table(tree) do
    #stuff
  end

  def encode(text, table) do
    #stuff
  end

  def decode(sequence, table) do
    #stuff
  end


end
