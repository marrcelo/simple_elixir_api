defmodule SimpleElixirApi.Repo do
  use Ecto.Repo,
    otp_app: :simple_elixir_api,
    adapter: Ecto.Adapters.Postgres
end
