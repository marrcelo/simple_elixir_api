defmodule SimpleElixirApiWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline,
    otp_app: :simple_elixir_api,
    module: SimpleElixirApiWeb.Auth.Guardian,
    error_handler: SimpleElixirApiWeb.Auth.ErrorHandler

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
