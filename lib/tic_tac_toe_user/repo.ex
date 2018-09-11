defmodule TicTacToeUser.Repo do
  use Ecto.Repo, otp_app: :tic_tac_toe_user, adapter: Mongo.Ecto
end
