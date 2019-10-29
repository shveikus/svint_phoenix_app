defmodule SvintPhoenixAppWeb.SharedView do
  use SvintPhoenixAppWeb, :view

  def get_time do
    Time.utc_now()
  end
end
