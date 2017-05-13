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
end
