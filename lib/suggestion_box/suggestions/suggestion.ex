defmodule SuggestionBox.Suggestions.Suggestion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suggestions" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(suggestion, attrs) do
    suggestion
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
