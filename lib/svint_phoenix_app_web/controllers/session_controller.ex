defmodule SvintPhoenixAppWeb.SessionController do
  use SvintPhoenixAppWeb, :controller
  # use SvintPhoenixAppWeb.Accounts
  alias SvintPhoenixApp.Accounts
  # use Logger
  # require Logger

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => auth_params}) do
    user = Accounts.get_by_email(auth_params["email"])
    IO.puts("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!#{inspect(auth_params)}")
    case Bcrypt.check_pass(user, auth_params["password"], [hash_key: :password_digest]) do
    {:ok, user} ->
      conn
      |> put_session(:current_user_id, user.id)
      |> put_flash(:info, "Signed in successfully.")
      |> redirect(to: Routes.page_path(conn, :index))
    {:error, _} ->
      conn
      |> put_flash(:error, "There was a problem with your username/password")
      |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Signed out successfully.")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
