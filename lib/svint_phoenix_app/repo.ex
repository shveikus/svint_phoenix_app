defmodule SvintPhoenixApp.Repo do
  use Ecto.Repo,
    otp_app: :svint_phoenix_app,
    adapter: Ecto.Adapters.Postgres
end
