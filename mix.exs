defmodule PlugExample.Mixfile do
  use Mix.Project

  def project do
    [
      app:             :plug_example,
      version:         "0.1.0",
      elixir:          "~> 1.4",
      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps:            deps(),
   ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PlugExample, []},
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.1"},
      {:plug, "~> 1.3"},
    ]
  end
end
