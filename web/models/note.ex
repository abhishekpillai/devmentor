defmodule Devmentor.Note do
  use Devmentor.Web, :model

  alias Devmentor.Note

  schema "notes" do
    field :body, :string
    field :note_type, :string

    belongs_to :user, Devmentor.User
    belongs_to :mentorship, Devmentor.Mentorship
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    required_params = [:body, :mentorship_id, :user_id, :note_type]
    change =
      struct
      |> cast(params, required_params)

    change =
      case Map.has_key?(change, :note_type) do
        false -> change |> put_change(:note_type, "general")
        true -> change
      end

    change
    |> validate_required(required_params)
    |> validate_inclusion(:note_type, ["general", "action_item"])
  end

  def by_mentorship(m_id) do
    query = from n in Note,
      where: n.mentorship_id == ^m_id,
      order_by: [desc: :inserted_at],
      preload: [:user]
    Devmentor.Repo.all(query)
  end
end
