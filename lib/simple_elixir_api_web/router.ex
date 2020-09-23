defmodule SimpleElixirApiWeb.Router do
  use SimpleElixirApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SimpleElixirApiWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
