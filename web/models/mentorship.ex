defmodule Devmentor.Mentorship do
  use Devmentor.Web, :model

  alias Devmentor.Mentorship

  schema "mentorships" do
    belongs_to :mentor, Devmentor.User
    belongs_to :mentee, Devmentor.User
    has_many :notes, Devmentor.Note
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:mentor_id, :mentee_id])
    |> validate_required([:mentor_id, :mentee_id])
  end

  def by_id(id) do
    mship =
      from m in Mentorship,
      where: m.id == ^id,
      left_join: notes in assoc(m, :notes),
      left_join: user in assoc(notes, :user),
      left_join: mentor in assoc(m, :mentor),
      left_join: mentee in assoc(m, :mentee),
      preload: [:mentor, :mentee, notes: {notes, user: user}]

    Devmentor.Repo.one(mship)
  end
end
