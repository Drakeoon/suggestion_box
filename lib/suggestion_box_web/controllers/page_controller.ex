defmodule SuggestionBoxWeb.PageController do
  use SuggestionBoxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
