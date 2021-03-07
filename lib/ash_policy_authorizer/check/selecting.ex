defmodule AshPolicyAuthorizer.Check.Selecting do
  @moduledoc false
  use AshPolicyAuthorizer.SimpleCheck

  @impl true
  def describe(opts) do
    "selecting #{opts[:attribute]}"
  end

  @impl true
  def match?(_actor, %{changeset: %Ash.Changeset{} = changeset}, opts) do
    Ash.Changeset.selecting?(changeset, opts[:attribute])
  end

  def match?(_actor, %{query: %Ash.Query{} = query}, opts) do
    Ash.Query.selecting?(query, opts[:attribute])
  end

  def match?(_, _, _), do: false
end
