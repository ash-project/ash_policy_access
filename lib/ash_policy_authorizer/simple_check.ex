defmodule AshPolicyAuthorizer.SimpleCheck do
  @type options :: Keyword.t()
  @callback match?(Ash.actor(), map(), options) :: boolean

  defmacro __using__(_) do
    quote do
      @behaviour AshPolicyAuthorizer.SimpleCheck
      @behaviour AshPolicyAuthorizer.Check

      def type(), do: :simple

      def strict_check(nil, _, _), do: {:ok, false}

      def strict_check(actor, context, opts) do
        {:ok, match?(actor, context, opts)}
      end
    end
  end
end