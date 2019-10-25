defmodule SvintPhoenixApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_digest, :string
    field :age, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :age, :password_digest])
    |> validate_required([:email, :age, :password_digest], message: "Put something here, man")
    |> validate_format(:email, ~r/^[A-Za-z0-9._%+-+']+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/)
    |> unique_constraint(:email)
    |> update_change(:password_digest, &Bcrypt.hash_pwd_salt/1)
  end

  def get_by_username(username) when is_nil(username) do
    nil
  end

  def get_by_username(username) do
    Repo.get_by(User, username: username)
  end
end
