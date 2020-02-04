# Structs:
defmodule Car do
  defstruct [brand: "", year: 0, model: "", cyl: 0, power: 0]
  def brand_model(%Car{brand: brand, model: model}) do
    "#{brand} #{model}"
  end
  def year(car = %Car{}) do
    car.year
  end
end

#Remember that when using a data structure from one model in another
#you need to recompile both models when the structure changes
#because the other model will otherwise still rely on the old definition.
