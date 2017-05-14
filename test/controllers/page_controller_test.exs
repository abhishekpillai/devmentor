defmodule Devmentor.PageControllerTest do
  use Devmentor.ConnCase

  alias Devmentor.{Mentorship, User, Repo}

  test "GET /phoenix_home", %{conn: conn} do
    conn = get conn, "/phoenix_home"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /", %{conn: conn} do
    user = Repo.insert! %User{}
    user2 = Repo.insert! %User{}
    Repo.insert! %Mentorship{mentor_id: user.id, mentee_id: user2.id}
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Your Mentor"
  end
end
