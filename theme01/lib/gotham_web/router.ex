defmodule GothamWeb.Router do
  use GothamWeb, :router
  alias GothamWeb.Router.Helpers, as: Routes
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GothamWeb do
    pipe_through :api
    resources "/clocks/:userID", ClockController, only: [:index, :create]
    resources "/users", UserController, only: [:show, :create]
    put "/users", UserController, :update
  end
end
