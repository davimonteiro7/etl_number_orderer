defmodule EtlNumberOrdererWeb.LoadControllerTest do
  use EtlNumberOrdererWeb.ConnCase

  test "GET /api/load_sorted_numbers", %{conn: conn} do
    IO.inspect("Testing - make the numbers available to be Loaded at one endpoint.")
    conn = get(conn, "/api/load_sorted_numbers")
    status = conn |> Map.from_struct() |> Map.get(:status)
    expected_status = 200
    assert status == expected_status
  end
end
