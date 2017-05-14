defmodule Devmentor.Repo.Migrations.AddNoteTypeColumn do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :note_type, :string
    end
  end
end
