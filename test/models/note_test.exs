defmodule Devmentor.NoteTest do
  use Devmentor.ModelCase

  alias Devmentor.Note

  @valid_attrs %{
    body: "some content",
    mentorship_id: 1,
    user_id: 1
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Note.changeset(%Note{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Note.changeset(%Note{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "set note_type as general by default" do
    changeset = Note.changeset(%Note{}, @valid_attrs)
    assert Ecto.Changeset.get_field(changeset, :note_type) == "general"
  end

  test "set note_type as action_item if passed in" do
    valid_attrs =
      @valid_attrs
      |> Map.put(:note_type, "action_item")
    changeset = Note.changeset(%Note{}, valid_attrs)
    assert Ecto.Changeset.get_field(changeset, :note_type) == "action_item"
  end

  test "changeset is invalid if non-approved type of note" do
    invalid_attrs =
      @valid_attrs
      |> Map.put(:note_type, "something else")
    changeset = Note.changeset(%Note{}, invalid_attrs)
    refute changeset.valid?
  end
end
