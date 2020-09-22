defmodule AshPolicyAuthorizer.Check.Attribute do
  @moduledoc false

  use AshPolicyAuthorizer.FilterCheck

  @impl true
  def describe(opts) do
    "record.#{opts[:attribute]} matches #{inspect(opts[:filter])}"
  end

  @impl true
  def filter(opts) do
    [{opts[:attribute], opts[:filter]}]
  end
end
