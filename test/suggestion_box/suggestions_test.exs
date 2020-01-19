defmodule SuggestionBox.SuggestionsTest do
  use SuggestionBox.DataCase

  alias SuggestionBox.Suggestions

  describe "suggestions" do
    alias SuggestionBox.Suggestions.Suggestion

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def suggestion_fixture(attrs \\ %{}) do
      {:ok, suggestion} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Suggestions.create_suggestion()

      suggestion
    end

    test "list_suggestions/0 returns all suggestions" do
      suggestion = suggestion_fixture()
      assert Suggestions.list_suggestions() == [suggestion]
    end

    test "get_suggestion!/1 returns the suggestion with given id" do
      suggestion = suggestion_fixture()
      assert Suggestions.get_suggestion!(suggestion.id) == suggestion
    end

    test "create_suggestion/1 with valid data creates a suggestion" do
      assert {:ok, %Suggestion{} = suggestion} = Suggestions.create_suggestion(@valid_attrs)
      assert suggestion.description == "some description"
    end

    test "create_suggestion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Suggestions.create_suggestion(@invalid_attrs)
    end

    test "update_suggestion/2 with valid data updates the suggestion" do
      suggestion = suggestion_fixture()
      assert {:ok, %Suggestion{} = suggestion} = Suggestions.update_suggestion(suggestion, @update_attrs)
      assert suggestion.description == "some updated description"
    end

    test "update_suggestion/2 with invalid data returns error changeset" do
      suggestion = suggestion_fixture()
      assert {:error, %Ecto.Changeset{}} = Suggestions.update_suggestion(suggestion, @invalid_attrs)
      assert suggestion == Suggestions.get_suggestion!(suggestion.id)
    end

    test "delete_suggestion/1 deletes the suggestion" do
      suggestion = suggestion_fixture()
      assert {:ok, %Suggestion{}} = Suggestions.delete_suggestion(suggestion)
      assert_raise Ecto.NoResultsError, fn -> Suggestions.get_suggestion!(suggestion.id) end
    end

    test "change_suggestion/1 returns a suggestion changeset" do
      suggestion = suggestion_fixture()
      assert %Ecto.Changeset{} = Suggestions.change_suggestion(suggestion)
    end
  end
end
