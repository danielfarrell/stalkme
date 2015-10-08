defmodule Stalkme.Repo do
  use Ecto.Repo, otp_app: :stalkme
  use Scrivener, page_size: 30
end
