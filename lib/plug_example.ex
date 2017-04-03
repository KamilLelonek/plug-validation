defmodule PlugExample do
  use Application

  def start(_type, _args),
    do: Supervisor.start_link(children(), strategy: :one_for_one)

  defp children do
    [
      Plug.Adapters.Cowboy.child_spec(:http, PlugExample.Router, [], port: 8080)
    ]
  end
end
