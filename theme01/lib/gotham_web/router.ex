defmodule GothamWeb.Router do
  use GothamWeb, :router
  alias GothamWeb.Router.Helpers, as: Routes
  
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GothamWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/clocks", ClockController, only: [:index]
    get("/clocks/:user_id", ClockController, :show)
    post("/clocks/:user_id", ClockController, :create)
    get("/workingtimes/:user_id", WorkingtimesController, :index)
    get("/workingtimes/:user_id/:id", WorkingtimesController, :show)
    post("/workingtimes/:user_id", WorkingtimesController, :create)
    resources "/workingtimes", WorkingtimesController, only: [:update, :delete]
    
  end
end
