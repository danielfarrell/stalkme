Dynamo.under_test(Stalkme.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Stalkme.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
