defmodule SuggestionBoxWeb.Router do
  use SuggestionBoxWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SuggestionBoxWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/suggestions", SuggestionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SuggestionBoxWeb do
  #   pipe_through :api
  # end
end
