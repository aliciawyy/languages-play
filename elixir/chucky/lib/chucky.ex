defmodule Chucky do
  @moduledoc """
  Documentation for Chucky.
  """

  use Application
  require Logger

  def start(type, _args) do
    case type do
      :normal ->
        Logger.info("Application is started on #{node()}.")
      {:takeover, old_node} ->
        Logger.info("#{node()} is taking over #{old_node}.")
      {:failover, old_node} ->
        Logger.info("#{old_node} is failing over to #{node()}.")
    end

    opts = [strategy: :one_for_one, name: {:global, :"Chucky.Supervisor"}]

    Supervisor.start_link([Chucky.Server], opts)
  end

  def fact do
    Chucky.Server.fact
  end

end
