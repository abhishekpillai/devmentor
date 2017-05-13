defmodule Devmentor.Mentorship do
  use Devmentor.Web, :model

  schema "mentorships" do
    field :mentor_id, :integer
    field :mentee_id, :integer

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
