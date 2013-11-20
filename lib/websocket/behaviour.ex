defmodule Websocket.Behaviour do
  @moduledoc """
  """

  @doc false
  defmacro __using__(_) do
    quote location: :keep do
      @behaviour :cowboy_websocket_handler

      @doc false
      def init({:tcp, :http}, _req, _opts), do: { :upgrade, :protocol, :cowboy_websocket }

      @doc false
      def websocket_init(_transport_name, req, _opts) do
        { :ok, req, :no_state }
      end

      @doc false
      def websocket_info({ :message, message }, req, state) do
        { :reply, { :text, message }, req, state }
      end

      @doc false
      def websocket_handle({ :text, message }, req, state) do
        { :reply, { :text, message }, req, state }
      end

      @doc false
      def websocket_terminate(_reason, _req, _state) do
        :ok
      end

      defoverridable [init: 3, 
        websocket_init: 3,
        websocket_info: 3,
        websocket_handle: 3,
        websocket_terminate: 3]

    end
  end

end
