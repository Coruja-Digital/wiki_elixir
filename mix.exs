defmodule Elixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :wiki_elixir,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps(),
      package: package(),
      source_url: "https://github.com/adamwight/wiki_elixir",
      docs: [
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:timex]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.0.0-rc.6", runtime: false},
      {:eventsource_ex, "~> 0.0.2"},
      {:ex_doc, "~> 0.20", only: :dev, runtime: false},
      {:feeder, "~> 2.3"},
      # Unfortunately, we have to follow eventsource_ex.  TODO: help them upgrade to httpoison 1.x
      {:httpoison, "~> 0.11"},
      {:mox, "~> 0.5", only: :test},
      {:timex, "~> 3.5"}
    ]
  end

  defp description do
    "Provides Elixir connectors to work with Wikipedia feeds."
  end

  defp package do
    [
      name: :wiki_elixir,
      maintainers: ["adamwight"],
      licenses: ["GPLv3"],
      links: %{"GitHub" => "https://github.com/adamwight/wiki_elixir"}
    ]
  end
end
