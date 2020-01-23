defmodule SuggestionBox.Repo.Migrations.CreateSuggestions do
  use Ecto.Migration

  def change do
    create table(:suggestions) do
      add :description, :text

      timestamps()
    end

  end
end
