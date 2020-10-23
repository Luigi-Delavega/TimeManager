defmodule GothamWeb.Router do
  use GothamWeb, :router
  alias GothamWeb.Router.Helpers, as: Routes
  

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/api", GothamWeb do
    pipe_through :api

    get "/users", UserController, :getAll
    resources "/users", UserController, except: [:new, :edit]
    # options "/users", UserController, :create
    # options "/users/:id", UserController, :remove

    resources "/clocks", ClockController, only: [:index]
    # required for post new clock & getAll by userId
    get("/clocks/:user_id", ClockController, :show_clocks)
    get("/clocks/:user_id", ClockController, :show)
    post("/clocks/:user_id", ClockController, :create)
    # options("/clocks/:user_id", ClockController, :create)

    # required for post new workingtime & getAll by userId
    get("/workingtimes/:user_id", WorkingtimesController, :show_workingtimes)
    get("/workingtimes/:user_id", WorkingtimesController, :show) ## pour post
    get("/workingtimes/:user_id/:id", WorkingtimesController, :showone) ## good
    get("/workingtimes/:user_id", WorkingtimesController, :index) ## need end start 
    post("/workingtimes/:user_id", WorkingtimesController, :create) ##marche
    # options("/workingtimes/:user_id", WorkingtimesController, :create)
    resources "/workingtimes", WorkingtimesController, only: [:update, :delete]
    
  end
end
