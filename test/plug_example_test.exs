defmodule PlugExampleTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias PlugExample.Router

  @opts Router.init([])

  describe "failure" do
    test "should reject a request with incomplete params" do
      conn = :get |> conn("/") |> Router.call(@opts)

      assert conn.state     == :sent
      assert conn.status    == 400
      assert conn.resp_body == "Query params: [\"page_size\"] must be provided!"
    end
  end

  describe "success" do
    test "should accept a request with all required params" do
      conn = :get |> conn("/?page_size=10") |> Router.call(@opts)

      assert conn.state     == :sent
      assert conn.status    == 200
      assert conn.resp_body == "Query params were: [\"page_size\"]."
    end
  end
end
