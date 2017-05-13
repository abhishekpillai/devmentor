defmodule Devmentor.MentorshipController do
  use Devmentor.Web, :controller

  alias Devmentor.Mentorship

  def index(conn, _params) do
    mentorships = Repo.all(Mentorship)
    render(conn, "index.html", mentorships: mentorships)
  end

  def new(conn, _params) do
    changeset = Mentorship.changeset(%Mentorship{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"mentorship" => mentorship_params}) do
    changeset = Mentorship.changeset(%Mentorship{}, mentorship_params)

    case Repo.insert(changeset) do
      {:ok, _mentorship} ->
        conn
        |> put_flash(:info, "Mentorship created successfully.")
        |> redirect(to: mentorship_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    mentorship = Repo.get!(Mentorship, id)
    render(conn, "show.html", mentorship: mentorship)
  end

  def edit(conn, %{"id" => id}) do
    mentorship = Repo.get!(Mentorship, id)
    changeset = Mentorship.changeset(mentorship)
    render(conn, "edit.html", mentorship: mentorship, changeset: changeset)
  end

  def update(conn, %{"id" => id, "mentorship" => mentorship_params}) do
    mentorship = Repo.get!(Mentorship, id)
    changeset = Mentorship.changeset(mentorship, mentorship_params)

    case Repo.update(changeset) do
      {:ok, mentorship} ->
        conn
        |> put_flash(:info, "Mentorship updated successfully.")
        |> redirect(to: mentorship_path(conn, :show, mentorship))
      {:error, changeset} ->
        render(conn, "edit.html", mentorship: mentorship, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    mentorship = Repo.get!(Mentorship, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(mentorship)

    conn
    |> put_flash(:info, "Mentorship deleted successfully.")
    |> redirect(to: mentorship_path(conn, :index))
  end
end
