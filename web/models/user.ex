defmodule Devmentor.User do
  use Devmentor.Web, :model

  schema "users" do
    field :name, :string
    field :avatar, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :avatar])
    |> validate_required([:name, :avatar])
  end
end
