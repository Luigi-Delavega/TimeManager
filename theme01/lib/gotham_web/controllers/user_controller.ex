defmodule GothamWeb.UserController do
  use GothamWeb, :controller

  alias Gotham.Export
  alias Gotham.Export.User

  action_fallback GothamWeb.FallbackController

  def index(conn, %{"username" => _username, "email" => _email} = params) do
    users = Export.get_user_by_mail_name!(params)
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Export.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Export.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Export.get_user!(id)

    with {:ok, %User{} = user} <- Export.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Export.get_user!(id)

    with {:ok, %User{}} <- Export.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
