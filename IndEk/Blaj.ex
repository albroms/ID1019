defmodule Blaj do
  #slutvärdefaktor
  def slv(r, n)do
    cond do
      r == 0 -> 1
      n == 1 -> (1+r)
      true -> :math.pow((1+r), n)
    end
  end

  #nuvärdefaktor
  def nuv(r, n) do
    1/slv(r, n)
  end

  #nusummefaktor
  def nus(r, n) do
    cond do
      r == 0 -> n
      nuv(r, n) == 1 -> 0
      true -> (1-nuv(r, n))/r
    end
  end

  #annuitetsfaktor
  def ann(r, n) do
    cond do
      r == 0 -> 1/n
      n == 0 -> {:fail, "div by 0"}
      true -> r/(1-nuv(r, n))
    end
  end

  #pay-backtid
  def payBackTime(g, u) do
    g/u
  end

  def shouldIInvest(g, a, rest, r, n) do
    #att lära sig i huvudet inför tentan:
    nuvarde = (-g) + a*nus(r, n) + rest*nuv(r, n)
    nuvRes=
      cond do
        nuvarde > 0 -> {:nuvarde, :yes}
        true -> {:nuvarde, :no}
      end
    annuitet = nuvarde * ann(r, n)
    annRes =
      cond do
        annuitet > 0 -> {:annuitet, :yes}
        true -> {:annuitet, :no}
      end
    #inte superanvändbar och kan ge fel resultat
    slutvärde = ((-g) + a * nus(r, n))*slv(r, n) + rest
    slutRes =
      cond do
        slutvärde > 0 -> {:slutvärde, :yes}
        true -> {:slutvärde, :no}
      end
    {nuvRes, annRes, slutRes}
  end

  def rorelsekapitalbehov(antal_dagar, antal_produkter, betalning_per_produkt) do
    antal_dagar*antal_produkter*betalning_per_produkt
  end

  

end
