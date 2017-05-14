defmodule Devmentor.PageControllerTest do
  use Devmentor.ConnCase

  alias Devmentor.{Mentorship, Repo}

  test "GET /phoenix_home", %{conn: conn} do
    conn = get conn, "/phoenix_home"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /", %{conn: conn} do
    Repo.insert! %Mentorship{mentor_id: 1, mentee_id: 2}
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Your Mentor"
  end
end
