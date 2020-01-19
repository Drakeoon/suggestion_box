defmodule SuggestionBox.Repo do
  use Ecto.Repo,
    otp_app: :suggestion_box,
    adapter: Ecto.Adapters.Postgres
end
