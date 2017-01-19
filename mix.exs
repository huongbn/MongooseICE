defmodule Fennec.Mixfile do
  use Mix.Project

  def project do
    [app: :fennec,
     version: "0.1.0",
     description: "STUN/TURN server",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     docs: docs(),
     dialyzer: dialyzer()]
  end

  def application do
    [extra_applications: [:logger],
     mod: {Fennec.Application, []}]
  end

  defp deps do
    [{:ex_doc, "~> 0.14", runtime: false, only: :dev},
     {:credo, "~> 0.5", runtime: false, only: :dev},
     {:dialyxir, "~> 0.4", runtime: false, only: :dev}]
  end

  defp docs do
    [main: "Fennec"]
  end

  defp dialyzer do
    [plt_core_path: ".dialyzer/",
     flags: ["-Wunmatched_returns", "-Werror_handling",
             "-Wrace_conditions", "-Wunderspecs"]]
  end
end