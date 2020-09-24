defmodule SimpleElixirApiWeb.UserView do
  use SimpleElixirApiWeb, :view
  alias SimpleElixirApiWeb.UserView

  def render("index.json", %{tb_users: tb_users}) do
    %{data: render_many(tb_users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, token: token}) do
    %{id: user.id,
      email: user.email,
      token: token,
      first_name: user.first_name,
      last_name: user.last_name,
      nick_name: user.nick_name}
  end
end
