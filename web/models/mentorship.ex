defmodule Devmentor.Mentorship do
  use Devmentor.Web, :model

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
end
