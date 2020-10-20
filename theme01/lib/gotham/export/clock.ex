defmodule Gotham.Export.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "clocks" do
    field :status, :boolean, default: false, null: false
    field :time, :naive_datetime, null: false
    field :user, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:time, :status])
    |> validate_required([:time, :status])
  end
end
