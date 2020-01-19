defmodule SuggestionBoxWeb.PageView do
  use SuggestionBoxWeb, :view

  def random_suggestion do
    words = [
      "I really liked latest Haxorz presentation! 😍😍😍",
      "I don't like when there's a mess in our kitchen! 😡",
      "Could you please do something about the air conditioning? It's really hot in our office 🔥",
      "Could we use more Elixir in our projects please? 🧪",
      "Why don't we organise an Elixir 🧪 meetup?"
    ]

    Enum.random(words)
  end
end
