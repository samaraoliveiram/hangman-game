defmodule Hman.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Hman.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hman.PubSub}
      # Start a worker by calling: Hman.Worker.start_link(arg)
      # {Hman.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Hman.Supervisor)
  end
end
