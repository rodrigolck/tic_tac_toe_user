defmodule TicTacToeUser.Guardian do
  use Guardian, otp_app: :tic_tac_toe_user

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.sub)}
  end

  def generate_token(%{"email" => email, "password" => password}) do
    TicTacToeUser.User
    |> TicTacToeUser.Repo.get_by(email: email)
    |> Comeonin.Bcrypt.check_pass(password)
    |> create_user_token
  end
  def generate_token(params), do: {:error, %{invalid_params: params}}

  defp create_user_token({:error, _message}), do: {:error, %{unauthorized: "Access denied due to invalid credentials"}}
  defp create_user_token({:ok, user}),
    do: TicTacToeUser.Guardian.encode_and_sign( %{sub: "user_id"}, %{user_id: user.id})

end
