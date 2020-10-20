defmodule Gotham.Export.Workingtimes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field :end, :naive_datetime, null: false
    field :start, :naive_datetime, null: false

    timestamps()
  end

  @doc false
  def changeset(workingtimes, attrs) do
    workingtimes
    |> cast(attrs, [:start, :end, :user_id])
    |> validate_required([:start, :end])
  end
end
