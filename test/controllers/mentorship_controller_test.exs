defmodule Devmentor.MentorshipControllerTest do
  use Devmentor.ConnCase

  alias Devmentor.{Mentorship, User}
  @valid_attrs %{
    mentee_id: 42,
    mentor_id: 42
  }
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, mentorship_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing mentorships"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, mentorship_path(conn, :new)
    assert html_response(conn, 200) =~ "New mentorship"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, mentorship_path(conn, :create), mentorship: @valid_attrs
    assert redirected_to(conn) == mentorship_path(conn, :index)
    assert Repo.get_by(Mentorship, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, mentorship_path(conn, :create), mentorship: @invalid_attrs
    assert html_response(conn, 200) =~ "New mentorship"
  end

  test "shows chosen resource", %{conn: conn} do
    user = Repo.insert! %User{}
    user_2 = Repo.insert! %User{}
    mentorship = Repo.insert! %Mentorship{mentor_id: user.id, mentee_id: user_2.id}
    conn = get conn, mentorship_path(conn, :show, mentorship)
    assert html_response(conn, 200) =~ "Show mentorship"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, mentorship_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    mentorship = Repo.insert! %Mentorship{}
    conn = get conn, mentorship_path(conn, :edit, mentorship)
    assert html_response(conn, 200) =~ "Edit mentorship"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    mentorship = Repo.insert! %Mentorship{}
    conn = put conn, mentorship_path(conn, :update, mentorship), mentorship: @valid_attrs
    assert redirected_to(conn) == mentorship_path(conn, :show, mentorship)
    assert Repo.get_by(Mentorship, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    mentorship = Repo.insert! %Mentorship{}
    conn = put conn, mentorship_path(conn, :update, mentorship), mentorship: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit mentorship"
  end

  test "deletes chosen resource", %{conn: conn} do
    mentorship = Repo.insert! %Mentorship{}
    conn = delete conn, mentorship_path(conn, :delete, mentorship)
    assert redirected_to(conn) == mentorship_path(conn, :index)
    refute Repo.get(Mentorship, mentorship.id)
  end
end
