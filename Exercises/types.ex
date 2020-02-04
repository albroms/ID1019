defmodule Types do
  @spec fib(integer()) :: integer()
  # Type specifiers are mainly for documentation,
  # but can also be used for automatic type error detection.

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n-1) + fib(n-2) end

  # How do we distinguish type variables from normal variables in Elixir?

  # Let's try to define a car in Elixir!
  {
    :car, "Volvo",
    {:model, "XC60", 2018},
    {:engine, "A4", 4, 2000, 140},
    {:perf, 4.6, 8.8}
  }

  def car_brand_model({:car, brand, {:model, model, _}, _, _}) do
    "#{brand} #{model}"
  end
  # These things can get complicated once we scale things up.
  # We could spend hours altering the pattern matching for our program
  # to work. A caveat we don't have in languages like Java or C, or?

  # Can we solve this? Let's try with a key-value list!
  {
    :car,
    "volvo",
    [
      {:model},
      {:year, 2018},
      {:engine, "A4"},
      {:cyl, 4},
      {:vol, 2000},
      {:power, 140},
      {:fuel, 4.6},
      {:acc, 8.8}
    ]
  }
  def car_brand_model( {:car, brand, prop}) do
    case List.keyfind(prop, :model, 0) do
      nil ->
        brand
      {:model, model} ->
        "#{brand} #{model}"
    end
  end
  #syntactic sugar for key-value lists:
  [a: 12, b: 34, c: 56]
  #we no longer have to specify each of the tuples ({:a, 12}, ...)

  # New problem: This gets slower as the list grows longer, can we solve this?

  # Introducing Maps!

  # Maps:
  # %{} : an empty map
  # myCar = %{:brand => "Volvo", :model => "XC60", :year => 2018}: define properties
  # %{:model => model} = myCar : pattern matching
  # newCar = %{myCar | :year => 2018} : map as template for new map

  # Problem: Still no support to detect errors!
end
