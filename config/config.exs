# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :tic_tac_toe_user, TicTacToeUserWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "H9K/U8WDX/olYN9gj3QL61SzeLrRPLmNrv1SrTMAK2/mNNDoDgnoRy07nOr9V49C",
  render_errors: [view: TicTacToeUserWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: TicTacToeUser.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian to generate and sign JWTs
# Obs. This is only the development secret key.
# Production key is fetched from AWS KMS
config :tic_tac_toe_user, TicTacToeUser.Guardian,
  issuer: "tic_tac_toe_user",
  allowed_algos: ["HS256"],
  secret_key: "5a37811464e7d378488b0f073e2193b093682e4e21f5d6f3ae0a4e1781e61a351fdc878a843424e81c73fb484a40d23f92c8dafac4870e74ede6e5e174423010",
  ttl: {1, :days}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
