defmodule EtlNumberOrderer.Bench do
  alias EtlNumberOrderer.Extract

  Benchee.run(
    %{
      "all_numbers" => fn -> Extract.all_numbers end
    }
  )

end
