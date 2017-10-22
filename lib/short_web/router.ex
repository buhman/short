defmodule ShortWeb.Router do
  use ShortWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ShortWeb do
    pipe_through :api
  end
end
