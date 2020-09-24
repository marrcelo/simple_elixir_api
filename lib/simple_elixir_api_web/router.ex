defmodule SimpleElixirApiWeb.Router do
  use SimpleElixirApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug SimpleElixirApiWeb.Auth.Pipeline
  end

  scope "/api", SimpleElixirApiWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]

    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  # scope "/api", SimpleElixirApiWeb do
  #   pipe_through [:api, :auth]
  #   resources "/users", UserController, except: [:new, :edit]
  # end
end
