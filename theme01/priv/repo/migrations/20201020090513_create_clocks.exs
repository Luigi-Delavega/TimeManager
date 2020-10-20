defmodule Gotham.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add :time, :naive_datetime, null: false
      add :status, :boolean, default: false, null: false
      add :userID, :id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:clocks, [:userID])
  end
end
