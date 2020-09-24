defmodule SimpleElixirApi.Repo.Migrations.UsersAddEmailPassword do
  use Ecto.Migration

   def change do
    alter table("tb_users") do
      add :email, :string
      add :encrypted_password, :string
      add :password, :string, virtual: true
    end

    create unique_index(:tb_users, [:email])
  end
end
