defmodule SvintPhoenixAppWeb.PageController do
  use SvintPhoenixAppWeb, :controller

  def index(conn, _params) do
  	name = "Here should be some text"
    render(conn, "index.html", %{name: name})
  end

  def contact(conn, _params) do
    render(conn, "contact.html", %{})
  end
end
