defmodule Devmentor.Repo.Migrations.AddUserIdToNotes do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :user_id, :integer
    end
  end
end
