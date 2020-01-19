defmodule SuggestionBoxWeb.PageController do
  use SuggestionBoxWeb, :controller
  alias SuggestionBox.Suggestions
  alias SuggestionBox.Suggestions.Suggestion

  def index(conn, _params) do
    suggestions = Suggestions.list_suggestions
    changeset = Suggestions.change_suggestion(%Suggestion{})

    render(conn, "index.html", [suggestions: suggestions, changeset: changeset])
  end
end
