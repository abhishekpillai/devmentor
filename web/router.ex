defmodule Devmentor.Router do
  use Devmentor.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Devmentor do
    pipe_through :browser # Use the default browser stack
    get "/phoenix_home", PageController, :phoenix_home

    get "/", PageController, :home
    resources "/users", UserController
    resources "/mentorships", MentorshipController
    resources "/notes", NoteController
  end

  # Other scopes may use custom stacks.
  scope "/api", Devmentor do
    pipe_through :api

    get "/mentorships/:id/notes", Api.MentorshipController, :notes, as: :api_mentorship
    post "/notes", Api.NoteController, :create, as: :api_note
  end
end
