defmodule EtlNumberOrdererWeb.Router do
  use EtlNumberOrdererWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EtlNumberOrdererWeb do
    pipe_through :api

    get "/load_sorted_numbers", LoadController, :index
  end
end
