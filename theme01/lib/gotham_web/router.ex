defmodule GothamWeb.Router do
  use GothamWeb, :router
  alias GothamWeb.Router.Helpers, as: Routes
  

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/api", GothamWeb do
    pipe_through :api
    options "/users", UserController, :create
    resources "/users", UserController, except: [:new, :edit]

    resources "/clocks", ClockController, only: [:index]
    get("/clocks/:user_id", ClockController, :show)
    post("/clocks/:user_id", ClockController, :create)
    


    get("/workingtimes/:user_id", WorkingtimesController, :index)


    get("/workingtimes/:user_id", WorkingtimesController, :show)
    get("/workingtimes/:user_id/:id", WorkingtimesController, :showw)
    post("/workingtimes/:user_id", WorkingtimesController, :create)
    resources "/workingtimes", WorkingtimesController, only: [:update, :delete]
    
  end
end
