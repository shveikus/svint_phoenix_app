defmodule SvintPhoenixAppWeb.PageController do
  use SvintPhoenixAppWeb, :controller

  def index(conn, _params) do
  	time = Time.utc_now()
  	name = "Here should be some text"
    render(conn, "index.html", %{time: time, name: name})
  end
end
