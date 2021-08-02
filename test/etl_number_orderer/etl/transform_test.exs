defmodule EtlNumberOrderer.TransformTest do
  use ExUnit.Case

  alias EtlNumberOrderer.Transform

  describe "Retrive sorted numbers from a given list." do
    test "call/1" do
      IO.inspect("Testing - get sorted numbers.")
      response = Transform.call([6.0,43.0,423.0,2.0,3.0,45.0,22.0,234.0])
      assert {:ok, _} = response
    end
  end
end
