defmodule GothamWeb.ClockController do
  use GothamWeb, :controller

  alias Gotham.Export
  alias Gotham.Export.Clock

  action_fallback GothamWeb.FallbackController

  def index(conn, _params) do
    clocks = Export.list_clocks()
    render(conn, "index.json", clocks: clocks)
  end

  def create(conn, %{"clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Export.create_clock(clock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

  def show(conn, %{"userID" => userID}) do
    clock = Export.get_clock!(userID)
    render(conn, "show.json", clock: clock)
  end

  def update(conn, %{"id" => id, "clock" => clock_params}) do
    clock = Export.get_clock!(id)

    with {:ok, %Clock{} = clock} <- Export.update_clock(clock, clock_params) do
      render(conn, "show.json", clock: clock)
    end
  end

  def delete(conn, %{"id" => id}) do
    clock = Export.get_clock!(id)

    with {:ok, %Clock{}} <- Export.delete_clock(clock) do
      send_resp(conn, :no_content, "")
    end
  end
end