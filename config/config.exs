# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :short,
  ecto_repos: [Short.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :short, ShortWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jcnAsSVf+b6qgtOV+tjAJsdhKbyKUs/pDBejLe68vCMrvz8rhWsazKGLIdJ4PPCq",
  render_errors: [view: ShortWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Short.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
