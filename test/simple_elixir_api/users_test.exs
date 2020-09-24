defmodule SimpleElixirApi.UsersTest do
  use SimpleElixirApi.DataCase

  alias SimpleElixirApi.Users

  describe "tb_users" do
    alias SimpleElixirApi.Users.User

    @valid_attrs %{
      first_name: "some first_name",
      last_name: "some last_name",
      nick_name: "some nick_name",
      email: "user@email.com",
      password: "123456"
    }
    @update_attrs %{
      first_name: "some updated first_name",
      last_name: "some updated last_name",
      nick_name: "some updated nick_name"
    }
    @invalid_attrs %{
      first_name: nil,
      last_name: nil,
      nick_name: nil,
      email: nil,
      password: nil
    }

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_tb_users/0 returns all tb_users" do
      user = user_fixture()
      assert Users.list_tb_users() == [%{user | password: nil}]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == %{user | password: nil}
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
      assert user.nick_name == "some nick_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
      assert user.nick_name == "some updated nick_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert %{user | password: nil} == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
