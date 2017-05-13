defmodule Devmentor.Repo.Migrations.AddMentorshipIdToNotes do
  use Ecto.Migration

  def change do
    alter table(:notes) do
      add :mentorship_id, :integer
    end
  end
end
