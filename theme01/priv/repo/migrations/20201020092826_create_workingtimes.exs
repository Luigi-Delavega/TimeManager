defmodule Gotham.Repo.Migrations.CreateWorkingtimes do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
<<<<<<< Updated upstream
      add :start, :naive_datetime, null: false
      add :end, :naive_datetime, null: false
      add :user, references(:users, on_delete: :nothing), null: false
=======
      add :start, :string, null: false
      add :end, :string, null: false
      add :user_id, references(:users, on_delete: :nothing)
>>>>>>> Stashed changes

      timestamps()
    end

    create index(:workingtimes, [:user])
  end
end
