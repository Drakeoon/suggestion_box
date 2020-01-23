defmodule SuggestionBoxWeb.SuggestionController do
  use SuggestionBoxWeb, :controller

  alias SuggestionBox.Suggestions
  alias SuggestionBox.Suggestions.Suggestion

  def index(conn, _params) do
    suggestions = Suggestions.list_suggestions()
    render(conn, "index.html", suggestions: suggestions)
  end

  def new(conn, _params) do
    changeset = Suggestions.change_suggestion(%Suggestion{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"suggestion" => suggestion_params}) do
    case Suggestions.create_suggestion(suggestion_params) do
      {:ok, suggestion} ->
        conn
        |> put_flash(:info, "Suggestion created successfully.")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    suggestion = Suggestions.get_suggestion!(id)
    render(conn, "show.html", suggestion: suggestion)
  end

  def edit(conn, %{"id" => id}) do
    suggestion = Suggestions.get_suggestion!(id)
    changeset = Suggestions.change_suggestion(suggestion)
    render(conn, "edit.html", suggestion: suggestion, changeset: changeset)
  end

  def update(conn, %{"id" => id, "suggestion" => suggestion_params}) do
    suggestion = Suggestions.get_suggestion!(id)

    case Suggestions.update_suggestion(suggestion, suggestion_params) do
      {:ok, suggestion} ->
        conn
        |> put_flash(:info, "Suggestion updated successfully.")
        |> redirect(to: Routes.suggestion_path(conn, :show, suggestion))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", suggestion: suggestion, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    suggestion = Suggestions.get_suggestion!(id)
    {:ok, _suggestion} = Suggestions.delete_suggestion(suggestion)

    conn
    |> put_flash(:info, "Suggestion deleted successfully.")
    |> redirect(to: Routes.suggestion_path(conn, :index))
  end
end
