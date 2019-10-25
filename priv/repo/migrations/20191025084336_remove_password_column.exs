defmodule SvintPhoenixApp.Repo.Migrations.RemovePasswordColumn do
  use Ecto.Migration

  def up do
    alter table (:users) do
      remove :password
    end
  end

  def down do
    alter table (:users) do
      add :password, :string, size: 64, null: false
    end
  end
end
