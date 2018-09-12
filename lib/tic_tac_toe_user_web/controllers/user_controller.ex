defmodule TicTacToeUserWeb.UserController do
  use TicTacToeUserWeb, :controller
  import Ecto.Query
  alias TicTacToeUser.{User, Repo}

  action_fallback TicTacToeUserWeb.FallbackController

  def show(conn, %{"id" => id} = params) do
    user = 
      (from user in User, where: user.id == ^id)
      |> Repo.one
    render(conn, "show.json", %{user: user})
  end
end
