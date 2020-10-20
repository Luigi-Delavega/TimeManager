defmodule Gotham.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :userID, :id, primary_key: true
      add :username, :string, null: false
      add :email, :string, null: false

      timestamps()
    end

  end
end
