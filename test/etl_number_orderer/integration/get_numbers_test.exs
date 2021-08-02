defmodule EtlNumberOrderer.Integration.GetNumbersTest do
  use ExUnit.Case

  alias EtlNumberOrderer.Integration.GetNumbers

  describe "Retrieve numbers from an external API" do
    test "numbers_by_page/1" do
      IO.inspect("Testing - get numbers from external source.")
      numbers = GetNumbers.numbers_by_page(1)
      assert is_list(numbers)
    end
  end
end
