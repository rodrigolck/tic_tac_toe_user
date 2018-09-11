defmodule TicTacToeUserWeb.Router do
  use TicTacToeUserWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TicTacToeUserWeb do
    pipe_through :api
  end
end
