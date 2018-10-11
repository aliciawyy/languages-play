defmodule Blitzy.MixProject do
  use Mix.Project

  def project do
    [
      app: :blitzy,
      version: "0.1.0",
      elixir: "~> 1.7",
      escript: [main_module: Blitzy.CLI],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Blitzy, []},
      application: [:logger, :httpoison, :timex]
    ]
  end

  defp aliases do
    [
      test: "test --cover"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:timex, "~> 3.4"},
      {:tzdata, "~> 0.1.8", override: true}
    ]
  end
end
