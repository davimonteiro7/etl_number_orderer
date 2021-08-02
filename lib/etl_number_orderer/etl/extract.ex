defmodule EtlNumberOrderer.Extract do
  use Flow
  alias EtlNumberOrderer.Integration.GetNumbers

  def call(numbers \\ [], low_page \\ 1, high_page \\ 1000) do
    :logger.info("Extraindo numeros da pagina #{low_page} até #{high_page}. ")

    case group_of_numbers(low_page, high_page) do
      [{:error, _} | _] -> {:error, "Não foi possivel extrair os numeros, verifique sua conexão."}

      [[]| _]           -> numbers |> List.flatten()

      grouped_numbers   ->
        current_numbers = [grouped_numbers | numbers]
        next_low_page  = low_page + 1000
        next_high_page = high_page + 1000
        call(current_numbers, next_low_page , next_high_page)
    end
  end

  defp group_of_numbers(low_page, high_page) do
    low_page..high_page
      |> Flow.from_enumerable(max_demand: 100)
      |> Flow.partition(max_demand: 5, stages: 1000)
      |> Flow.map(&GetNumbers.numbers_by_page/1)
      |> Enum.to_list()
  end
end
