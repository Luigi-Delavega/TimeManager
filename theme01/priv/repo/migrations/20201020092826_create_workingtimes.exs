defmodule Gotham.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add :start, :string, null: false
      add :end, :string, null: false
      add :user, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:workingtimes, [:user])
  end
end
