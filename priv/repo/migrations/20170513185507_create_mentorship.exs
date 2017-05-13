defmodule Devmentor.Repo.Migrations.CreateMentorship do
  use Ecto.Migration

  def change do
    create table(:mentorships) do
      add :mentor_id, :integer
      add :mentee_id, :integer

      timestamps()
    end

  end
end
