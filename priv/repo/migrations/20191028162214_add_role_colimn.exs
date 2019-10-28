defmodule SvintPhoenixApp.Repo.Migrations.AddRoleColimn do
  use Ecto.Migration

  def up do
    alter table(:users) do
      add :role, :string, default: "user"
    end
  end

  def down do
    alter table(:users) do
      remove :role
    end
  end
end
