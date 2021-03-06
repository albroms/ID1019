defmodule Hinges do
  #@type hinge :: {260, 40, 30}
  #@type latch :: {180, 60, 24}

  #@spec search(m, t, hinge, latch) :: {h, l, p}

  def search(m, t, {hm, ht, hp} = h, {lm, lt, lp} = l) when ((m >= hm) and (t >= ht) and (m >= lm) and (t >= lt)) do
    # We have material and time to make either a hinge or a latch
    {hi, li, pi} = search((m-hm), (t-ht), h, l)
    {hj, lj, pj} = search((m-lm), (t-lt), h, l)
    # Which alternative will give us the maximum profit?
    if((pi+hp) > (pj+lp)) do
      # make hinge
      {(hi+1), li, (pi+hp)}
    else
      # make latch
      {hi, (li+1), (pi+lp)}
    end
  end

  def search(m, t, {hm, ht, hp} = h, l) when (m >= hm) and (t >= ht) do
    # We can make a hinge
    {hn, ln, p} = search((m-hm), (t-ht), h, l)
    {hn+1, ln, (p+hp)}
  end
  def search(m, t, h, {lm, lt, lp} = l) when (m >= lm) and (t >= lt) do
    # We can make a latch
    {hn, ln, p} = search((m-lm), (t-lt), h, l)
    {hn, (ln+1), (p+lp)}
  end
  def search(_, _, _, _) do
    # We can make neither
    {0, 0, 0}
  end

  def memory(material, time, hinge, latch) do
    mem = Memory.new()
    {solution, _} = search(material, time, hinge, latch, mem)
    solution
  end

  def check(material, time, hinge, latch, mem) do
    case Memory.lookup({material, time}, mem) do
      nil ->
        ## no previous solution found
        {solution, mem} = search(material, time, hinge, latch, mem)
        {solution, Memory.store({material, time}, solution, mem)}
      found ->
        {found, mem}
    end

    def search(m, t, h, l, mem) when ((m >= hm) and (t >= ht) and (m >= lm) and (t >= lt)) do
      {{hi, li, pi}, mem} = check(, mem)
      {{hj, lj, pj}, mem} = check(..., mem)
      if ... do
        {..., mem}
      else
        {..., mem}
      end
    end

  end

end
