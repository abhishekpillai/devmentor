defmodule Devmentor.MentorshipTest do
  use Devmentor.ModelCase

  alias Devmentor.Mentorship

  @valid_attrs %{mentee_id: 42, mentor_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Mentorship.changeset(%Mentorship{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Mentorship.changeset(%Mentorship{}, @invalid_attrs)
    refute changeset.valid?
  end
end
