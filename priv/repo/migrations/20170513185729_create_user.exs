defmodule Devmentor.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :avatar, :string

      timestamps()
    end

  end
end