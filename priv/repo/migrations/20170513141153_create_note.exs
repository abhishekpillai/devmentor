defmodule Devmentor.Repo.Migrations.CreateNote do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :body, :string

      timestamps()
    end

  end
end
