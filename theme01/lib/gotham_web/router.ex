defmodule GothamWeb.Router do
  use GothamWeb, :router
  alias GothamWeb.Router.Helpers, as: Routes
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GothamWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/clocks", ClockController, except: [:new, :edit]
    post("/clocks/:user_id", ClockController, :create)
  end
end
