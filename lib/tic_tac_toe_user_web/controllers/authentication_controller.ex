defmodule TicTacToeUserWeb.AuthenticationController do
  use TicTacToeUserWeb, :controller

  action_fallback TicTacToeUserWeb.FallbackController

  def authenticate(conn, params) do
    with {:ok, token, content } <- TicTacToeUser.Guardian.generate_token(params),
      do: render(conn, "create.json", %{response: token})
  end
end
