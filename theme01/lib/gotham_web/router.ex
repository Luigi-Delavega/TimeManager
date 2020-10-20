defmodule GothamWeb.Router do
  use GothamWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GothamWeb do
    pipe_through :api
    resources "/clocks", ClockController, only: [:show, :create]
    resources "/users", UserController, only: [:show, :create]
    put "/users", UserController, :update
  end
end
