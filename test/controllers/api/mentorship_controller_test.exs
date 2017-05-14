defmodule Devmentor.Api.MentorshipControllerTest do
  use Devmentor.ConnCase

  alias Devmentor.{Repo, Note, Mentorship, User}

  describe "notes/2" do
    test "returns 200 and gets all notes for a mentorship" do
      user_abhi = Repo.insert! %User{ name: "abhi" }
      user_neely = Repo.insert! %User{ name: "neely" }

      mship =
        %Mentorship{ mentor_id: user_abhi.id, mentee_id: user_neely.id }
        |> Repo.insert!()

      notes = [
        %Note{ body: "test note", mentorship_id: mship.id, user_id: user_abhi.id },
        %Note{ body: "test note 2", mentorship_id: mship.id, user_id: user_neely.id }
      ]
      Enum.each(notes, &Repo.insert!(&1))

      conn = get build_conn(), api_mentorship_path(build_conn(), :notes, mship.id)
      assert json_response(conn, 200) == %{
        "data" => [
          %{ "body" => "test note", "user" => %{ "name" => "abhi" } },
          %{ "body" => "test note 2", "user" => %{ "name" => "neely" } },
        ]
      }
    end

    test "returns 200 and empty array if no notes" do
      user_abhi = Repo.insert! %User{ name: "abhi" }
      user_neely = Repo.insert! %User{ name: "neely" }

      mship =
        %Mentorship{ mentor_id: user_abhi.id, mentee_id: user_neely.id }
        |> Repo.insert!()

      conn = get build_conn(), api_mentorship_path(build_conn(), :notes, mship.id)
      assert json_response(conn, 200) == %{ "data" => [] }
    end

    test "returns 404 if mentorship not found" do
      conn = get build_conn(), api_mentorship_path(build_conn(), :notes, 1)
      assert json_response(conn, 404)
    end
  end
end
