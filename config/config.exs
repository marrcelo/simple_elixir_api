# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :simple_elixir_api,
  ecto_repos: [SimpleElixirApi.Repo]

# Configures the endpoint
config :simple_elixir_api, SimpleElixirApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nUuJp8PMLIljYwGRzfXP/4fc7ULlLNSLwD9UwrJZyTd4oYJDYO5ZKiNQ0Ry3AT4o",
  render_errors: [view: SimpleElixirApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SimpleElixirApi.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "+ZhT54iZ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
