defmodule EtlNumberOrdererWeb.LoadController do
  use EtlNumberOrdererWeb, :controller

  alias EtlNumberOrderer.{Extract, Transform}

  def index(conn, _params) do
    Extract.call() |> Transform.call() |> handle_response(conn)
  end

  defp handle_response({:ok, numbers}, conn) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(200, Jason.encode!(%{sorted_numbers: numbers}, [pretty: true]))
  end
  defp handle_response({:error, reason}, conn) do
    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json; charset=utf-8")
    |> Plug.Conn.send_resp(404, Jason.encode!(%{error: reason}, [pretty: true]))
  end
end
