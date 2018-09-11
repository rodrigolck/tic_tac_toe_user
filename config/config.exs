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

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"