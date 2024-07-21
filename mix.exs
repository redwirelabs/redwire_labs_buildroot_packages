defmodule RedwireLabsBuildrootPackages.MixProject do
  use Mix.Project

  def project do
    [
      app: :redwire_labs_buildroot_packages,
      version: "0.1.0",
      elixir: "~> 1.16",
      buildroot_package: true,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      "docs.show": ["docs", &open("doc/index.html", &1)]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Buildroot packages for Redwire Labs Nerves systems
    """
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md", "LICENSE.txt"]
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/redwirelabs/redwire_labs_buildroot_packages"},
      maintainers: ["Alex McLain"],
      files: [
        "lib",
        "package",
        "mix.exs",
        "Config.in",
        "LICENSE.txt",
        "README.md"
      ]
    ]
  end

  # Open a file with the default application for its type.
  defp open(file, _args) do
    # Linux
    # Mac
    open_command =
      System.find_executable("xdg-open") ||
        System.find_executable("open") ||
        raise "Could not find executable 'open' or 'xdg-open'"

    System.cmd(open_command, [file])
  end
end
