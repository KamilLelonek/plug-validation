defmodule PlugValidation.Plugs.RequireParamsTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias PlugValidation.Plugs.RequireParams

  @opts RequireParams.init([params: ["s"]])

  describe "failure" do
    test "should reject a request with incomplete params" do
      conn = :get |> conn("/") |> RequireParams.call(@opts)

      assert conn.state     == :sent
      assert conn.status    == 400
      assert conn.resp_body == "Query params: [\"s\"] must be provided!"
    end
  end

  describe "success" do
    test "should accept a request with all required params" do
      conn = :get |> conn("/?s=elixir") |> RequireParams.call(@opts)

      assert conn.state     == :sent
      assert conn.status    == 200
      assert conn.resp_body == "Query params were: [\"s\"]."
    end
  end
end
