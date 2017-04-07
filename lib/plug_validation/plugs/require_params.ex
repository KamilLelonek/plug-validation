defmodule PlugValidation.Plugs.RequireParams do
  import Plug.Conn

  def init(opts),
    do: Keyword.fetch!(opts, :params)

  def call(conn, params) do
    conn
    |> query_params()
    |> contains_fields?(params)
    |> handle_response(conn)
  end

  defp query_params(conn) do
    conn
    |> Plug.Conn.fetch_query_params()
    |> Map.get(:query_params)
    |> Map.keys()
  end

  defp contains_fields?(keys, fields),
    do: {Enum.all?(fields, &(&1 in keys)), fields, keys}

  defp handle_response({true, _fields, keys}, conn),
    do: send_resp(conn, 200, "Query params were: #{inspect keys}.")

  defp handle_response({false, fields, _keys}, conn),
    do: send_resp(conn, 400, "Query params: #{inspect fields} must be provided!")
end
