defmodule HmanWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      HmanWeb.Telemetry,
      # Start the Endpoint (http/https)
      HmanWeb.Endpoint
      # Start a worker by calling: HmanWeb.Worker.start_link(arg)
      # {HmanWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HmanWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HmanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
