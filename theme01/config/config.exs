# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :gotham,
  ecto_repos: [Gotham.Repo]

# Configures the endpoint
config :gotham, GothamWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7qhFCRUK4Ac5uFGtO57MVcFKD7c9eoE1dnnAkG7WpB99eRG9fJtv0b1t3zfYMBEz",
  render_errors: [view: GothamWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Gotham.PubSub,
  live_view: [signing_salt: "0jD7AZFO"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
