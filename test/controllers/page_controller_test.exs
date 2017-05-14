defmodule Devmentor.PageControllerTest do
  use Devmentor.ConnCase

  test "GET /phoenix_home", %{conn: conn} do
    conn = get conn, "/phoenix_home"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Your Mentor"
  end
end
