# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ac_catalog,
  ecto_repos: [AcCatalog.Repo]

# Configures the endpoint
config :ac_catalog, AcCatalogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fU8ggmbhZMoB9Z8fH9IvDJtiZ839N97al3MfTGucmycjDUY6iAX55I2ODJKoUHmr",
  render_errors: [view: AcCatalogWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AcCatalog.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "n6dUQlq4mgs8hBgbTMG4Tg1erAg2ZCiD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
