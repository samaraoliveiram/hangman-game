defmodule Hman.Repo do
  use Ecto.Repo,
    otp_app: :hman,
    adapter: Ecto.Adapters.Postgres
end
