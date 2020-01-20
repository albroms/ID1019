defmodule Huffman do

  # a leaf is represented as a character and its frequency
  # each node is a simple tuple with two branches {left, right}

  def sample() do
    'the quick brown fox jumps over the lazy dog
    this is a sample text that we will use when we build
    up a table we will only handle lower case letters and
  no punctuation symbols the frequency will of course not
  represent english but it is probably not that far off'
  end

  def text, do: 'this is something that we should encode'

  #def test do
  #  sample = sample()
  #  tree = tree()
  #  encode = encode_table(tree)
  #  decode = decode_table(tree)
  #  text = text()
  #  seq = encode(text, encode)
  #  decode(seq, decode)
  #end

  def tree(sample) do
    freq = freq(sample, [])
    tree = huffman(freq)
    table = encode_table(tree)
    #text = text()
    #encode(text, table)
  end

  def huffman(freq) do
    huffman_tree(sort(freq))
  end
  def huffman_tree([{tree, _}]) do tree end
  def huffman_tree([{ta, fa}, {tb, fb} | rest]) do
    inserted = insert({ {{ta, fa}, {tb, fb}}, fa+fb}, rest)
    huffman_tree(inserted)
  end

  def insert(a, []) do [a] end
  def insert({ta, fa}, [{tb, fb} | rest]) when fa < fb do
    [{ta, fa}, {tb, fb} | rest]
  end
  def insert(a, [b|rest]) do
    [b | insert(a, rest)]
  end
  def sort([])do [] end

  def sort([a]) do [a] end

  def sort(table) do
    {a, b} = split(table, [], [])
    as = sort(a)
    bs = sort(b)
    #merge
  end
  def split([], a, b) do {a, b} end
  def split([h|t], a, b) do
    split(t, b, [h|a])
  end

  def merge([], b) do b end
  def merge(a, []) do a end
  def merge([{ac, af}| at], [{bch, bf}|bt]) when af < bf do
    [{ac, af}|merge(at, [{bch, bf}|bt])]
  end
  def merge(a, [bh|bt]) do
    [bh| merge(a, bt)]
  end

  def freq([], table) do table end
  def freq([h|t], table) do
    freq(t, update(h, table))
  end

  def update(char, []) do [{char, 1}] end
  def update(char, [{char, f}|rest]) do
    [{char, f+1}|rest]
  end
  def update(char, [other|rest]) do
    [other| update(char, rest)]
  end






  def encode_table(tree) do
    encode_table(tree, [])
  end
  def encode_table({{left, right}, _}, seq) do
    tl encode(left, [0|seq])
    tr = encode(right, [1|seq])
    tl ++ tr
  end
  def encode_table({char, _}, seq) do
    [{char, Enum.reverse(seq)}]
  end


  def encode([], _) do [] end
  def encode([char], [_|rest]) do
    lookup(char, rest)
  end
  def encode([char|rest], table) do
    seq = lookup(char, table)
    seq ++ encode(rest, table)
  end

  def lookup(char, [{char, seq}|_]) do seq end
  def lookup(char, [_|rest]) do
    lookup(char, rest)
  end

end
