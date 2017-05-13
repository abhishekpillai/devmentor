defmodule Devmentor.Note do
  use Devmentor.Web, :model

  schema "notes" do
    field :body, :string
    field :mentorship_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    required_params = [:body, :mentorship_id]
    struct
    |> cast(params, required_params)
    |> validate_required(required_params)
  end
end
