defmodule Dynamic do
  # product = {material, time, price}
  #hinge = {260, 40, 30}
  #latch = {180, 60, 24}

  def search(m, t, {hm, ht, hp}=h, {lm, lt, lp}=l) when (m >= hm) and (t >= ht) and (m >= lm) and (t >= lt) do
    ## we're able to make a hinge or latch
    {hi, li, pi} = search((m-hm), (t-ht), h, l)
    {hj, lj, pj} = search((m-lm), (t-lt), h, l)

    ## which alternative will maximize profits?
    if (pi + hp) > (pj + lp) do
      ## make a hinge
      {(hi+1), li, (pi+hp)}
    else
      ## make a latch
      {hj, (lj+1), (pj+lp)}
    end
  end

  def search(m, t, {hm, ht, hp}=h, l) when (m >= hm) and (t >= ht) do
    ## we can make a hinge
    {hn, ln, p} = search((m-hm), (t-ht), h, l)
    {hn+1, ln, (p+hp)}
  end

  def search(m, t, h, {lm, lt, lp}=l) when (m >= lm) and (t >= lt) do
    ## we can make a latch
    {hn, ln, p} = search((m-lm), (t-lt), h, l)
    {hn, ln+1, (p+lp)}
  end
  def search(_, _, _, _) do
    ## we can't make anything
    {0, 0, 0}
  end
end
