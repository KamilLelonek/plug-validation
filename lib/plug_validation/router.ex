defmodule PlugValidation.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  forward "/",
    to:        PlugValidation.Plugs.RequireParams,
    init_opts: [params: ["page_size"]]
end
