defmodule Gotham.Export.Workingtimes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :string, null: false
    field :start, :string, null: false
    field :user, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(workingtimes, attrs) do
    workingtimes
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end, :user])
    |> validate_format(:end, ~r/^([0-9]{4})-([0-1][0-9])-([0-3][0-9])\s([0-1][0-9]|[2][0-3]):([0-5][0-9]):([0-5][0-9])$/, message: "Date must be in 'YYYY-MM-DD HH:mm:ss' format")
    |> validate_format(:start, ~r/^([0-9]{4})-([0-1][0-9])-([0-3][0-9])\s([0-1][0-9]|[2][0-3]):([0-5][0-9]):([0-5][0-9])$/, message: "Date must be in 'YYYY-MM-DD HH:mm:ss' format")
  end
end
