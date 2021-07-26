defmodule EtlNumberOrdererWeb.PageController do
  use EtlNumberOrdererWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
