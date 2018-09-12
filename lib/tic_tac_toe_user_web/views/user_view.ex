defmodule TicTacToeUserWeb.UserView do
  use TicTacToeUserWeb, :view

  def render("show.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      name: user.name
    }
  end

end