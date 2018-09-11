defmodule TicTacToeUserWeb.Router do
  use TicTacToeUserWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TicTacToeUserWeb do
    pipe_through :api
    post "/authenticate", AuthenticationController, :authenticate 
  end
end
