defmodule Benchmark do
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
    |> IO.puts
  end
end

table = :ets.new(:items, [:set, :protected, :named_table])

1..50_000_000 |> Enum.each(fn(i) -> :ets.insert(table, {"some_key#{i}", 1}) end)

Benchmark.measure(fn -> :ets.lookup(table, "some_key999999") end)

# => 4.0e-6 4 mikrosekunden!
