defmodule SvintPhoenixApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :age, :integer

      timestamps()
    end

  end
end
