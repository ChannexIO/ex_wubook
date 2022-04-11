defmodule ExWubook.MixProject do
  use Mix.Project

  @version "0.2.26"

  def project do
    [
      app: :ex_wubook,
      version: @version,
      elixir: "~> 1.12.3",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      name: "ExWubook",
      source_url: "https://github.com/ChannexIO/ex_wubook"
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:xmlrpc, "~> 1.4"},
      {:http_client, github: "ChannexIO/http_client", tag: "v0.3.7"},
      {:ex_doc, "~> 0.28", only: :dev},
      {:html_entities, "~> 0.5.2"}
    ]
  end

  defp description() do
    "Wubook API Extension for Elixir"
  end

  defp package() do
    [
      name: "ex_wubook",
      files: ~w(lib config .formatter.exs mix.exs README.md LICENSE),
      maintainers: ["Andrew Judis Yudin"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/ChannexIO/ex_wubook"}
    ]
  end
end
