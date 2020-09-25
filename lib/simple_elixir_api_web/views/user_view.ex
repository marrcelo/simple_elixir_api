defmodule SimpleElixirApiWeb.UserView do
  use SimpleElixirApiWeb, :view
  alias SimpleElixirApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      nick_name: user.nick_name
    }
  end

  def render("user_with_token.json", %{user: user, token: token}) do
    %{
      id: user.id,
      email: user.email,
      token: token,
      first_name: user.first_name,
      last_name: user.last_name,
      nick_name: user.nick_name
    }
  end
end
