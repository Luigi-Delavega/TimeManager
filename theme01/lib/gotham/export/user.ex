defmodule Gotham.Export.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "users" do
    field :userID, :id, primary_key: true
    field :email, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, message: "Must be in Email format 'X@X.X''")
  end
end
