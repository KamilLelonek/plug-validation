defmodule PlugExample.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/",
    to:        PlugExample.Plugs.RequireParams,
    init_opts: [params: ["page_size"]]
end
