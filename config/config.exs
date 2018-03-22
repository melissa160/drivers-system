# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :registering,
  ecto_repos: [Registering.Repo]

# Configures the endpoint
config :registering, Registering.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eFQtr5RDIMlwcJRlBTNf21VNk5BmDZjFdUse9TI3gIlYi/7rUaZ6B9KWuW6Biql0",
  render_errors: [view: Registering.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Registering.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
