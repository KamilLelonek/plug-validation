defmodule PlugExampleTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias PlugExample.Router

  @opts Router.init([])

  test "should return :ok response" do
    conn = :get |> conn("/") |> Router.call(@opts)

    assert conn.state     == :sent
    assert conn.status    == 200
    assert conn.resp_body == "Hello from PlugExample!"
  end
end
