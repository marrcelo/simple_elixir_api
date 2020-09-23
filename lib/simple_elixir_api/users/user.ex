defmodule SimpleElixirApi.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tb_users" do
    field :first_name, :string
    field :last_name, :string
    field :nick_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :nick_name])
    |> validate_required([:first_name, :last_name, :nick_name])
  end
end
