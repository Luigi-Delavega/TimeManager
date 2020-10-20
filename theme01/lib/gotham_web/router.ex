defmodule GothamWeb.Router do
  use GothamWeb, :router
  alias GothamWeb.Router.Helpers, as: Routes
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GothamWeb do
    pipe_through :api
    resources "/clocks", ClockController, only: [:index, :create]
<<<<<<< HEAD
    resources "/users", UserController, only: [:index, :show, :create, :update]
=======
    resources "/users", UserController, only: [:index, :show, :create, :update, :delete]
>>>>>>> 6d04220ac7b292b68972c862cc69da03d699be82
  end
end
