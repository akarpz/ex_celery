defmodule ExCelery.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_celery,
      version: "0.2.0",
      description: description(),
      package: package(),
      deps: deps(),
    ]
  end

  def application do
    application(Mix.env)
  end

  def application(:test) do
    [applications: [:logger]]
  end

  def application(_) do
    [
      applications: [:logger],
      mod: {ExCelery.Application, []},
    ]
  end

  defp deps do
    [
      {:amqp_client, git: "https://github.com/jbrisbin/amqp_client.git", override: true},
      {:amqp, "3.1.1"},
      {:jason, "1.3.0"},
      {:uuid, "~> 1.1"},
      {:mock, "~> 0.3.7", only: :test},
    ]
  end

  defp description do
    """
    A Celery producer for Elixir. Currently supports the RabbitMQ broker, and
    only publishing tasks (not running them or retrieving their result).
    """
  end

  defp package do
    [
     maintainers: ["Rob Golding", "Adam Karpowich"],
     licenses: ["MIT"],
     links: %{
       "GitHub" => "https://github.com/akarpz/ex_celery",
       "Docs" => "https://github.com/akarpz/ex_celery",
     },
  ]
  end
end
