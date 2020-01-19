defmodule SuggestionBoxWeb.LayoutView do
  use SuggestionBoxWeb, :view

  def has_flash_message(conn) do
    get_flash(conn, :info) || get_flash(conn, :error)
  end
end
