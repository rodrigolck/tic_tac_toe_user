defmodule TicTacToeUserWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.
 
  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use TicTacToeUserWeb, :controller

  def call(conn, {:error, error}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(TicTacToeUserWeb.AuthenticationView, "error.json", response: error)
  end
end
