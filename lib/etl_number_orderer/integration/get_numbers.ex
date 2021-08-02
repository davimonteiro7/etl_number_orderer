defmodule EtlNumberOrderer.Integration.GetNumbers do
  alias Finch.Response

  def child_spec do
    {
      Finch,
      name: __MODULE__,
      pools: %{ :default => [size: 100] }
    }
  end

  def numbers_by_page(page_num) do
    :get
    |> Finch.build("http://challenge.dienekes.com.br/api/numbers?page=#{page_num}")
    |> Finch.request(__MODULE__)
    |> handle_response()
  end


  defp handle_response({:ok, %Response{body: body}}) do
    body
    |> Poison.decode!()
    |> Map.get("numbers")
  end
  defp handle_response({:error, reason}), do: {:error, reason}

end
