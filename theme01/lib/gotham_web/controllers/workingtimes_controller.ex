defmodule GothamWeb.WorkingtimesController do
  use GothamWeb, :controller

  alias Gotham.Export
  alias Gotham.Export.Workingtimes

  action_fallback GothamWeb.FallbackController

    def indexAll(conn, _params) do
    workingtimes = Export.list_workingtimes()
    render(conn, "index.json", workingtimes: workingtimes)
    end

  def index(conn, %{"end" => _end, "start" => _start, "user_id" => user_id} = params) do
    workingtimes = Export.get_workingtime_by_end_start!(params)
    render(conn, "index.json", workingtimes: workingtimes)
  end


  def create(conn, %{"user_id" => user_id, "workingtimes" => workingtimes_params}) do
    with {:ok, %Workingtimes{} = workingtimes} <- Export.create_workingtimes(Map.merge(%{"user_id" => user_id}, workingtimes_params)) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtimes_path(conn, :show, workingtimes))
      |> render("show.json", workingtimes: workingtimes)
    end
  end

  def show_workingtimes(conn, %{"user_id" => user_id}) do
    workingtimes = Export.get_workingtimes_by_user_id!(user_id)
    render(conn, "index.json", workingtimes: workingtimes)
  end

  def showone(conn, %{"user_id" => user_id, "id" => id} = params) do
    workingtimes = Export.get_oneworkingtimes!(params)
    render(conn, "show.json", workingtimes: workingtimes)
  end

  def show(conn, %{"user_id" => user_id}) do
    workingtimes = Export.get_workingtimes!(user_id)
    render(conn, "show.json", workingtimes: workingtimes)
  end

  def update(conn, %{"id" => id, "workingtimes" => workingtimes_params}) do
    workingtimes = Export.get_workingtimes!(id)

    with {:ok, %Workingtimes{} = workingtimes} <- Export.update_workingtimes(workingtimes, workingtimes_params) do
      render(conn, "show.json", workingtimes: workingtimes)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtimes = Export.get_workingtimes!(id)

    with {:ok, %Workingtimes{}} <- Export.delete_workingtimes(workingtimes) do
      send_resp(conn, :no_content, "")
    end
  end
end
