defmodule EtlNumberOrderer.ExtractTest do
  use ExUnit.Case
  alias EtlNumberOrderer.Extract

  describe "Retrive numbers from all pages." do
    test "call/3" do
      IO.inspect("Testing - extract all numbers...")
      all_numbers = Extract.call()
      assert is_list(all_numbers)
    end
  end
end
