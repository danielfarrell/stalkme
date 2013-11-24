defmodule Mailme.Mailer do

  @doc false
  defmacro __using__(mailer_opts) do
    URI.default_port "smtp", 25
    smtp_info = System.get_env("SMTP_URL") |> URI.parse

    quote do

      def send(conn, opts) do
        Dict.put(opts, :body, Mailme.Renderer.Dynamo.render(conn, opts))
          |> build_email
          |> deliver
      end

      def send(opts) do
        Dict.put(opts, :body, Mailme.Renderer.Simple.render(opts))
          |> build_email
          |> deliver
      end

      defp build_email(opts) do
        Keyword.merge(unquote(mailer_opts), opts)
          |> Mailme.Builder.build
      end

      defp deliver(email) do
        :gen_smtp_client.send(email, send_info)
      end

      defp send_info do
        Keyword.merge [relay: unquote(smtp_info.host), port: unquote(smtp_info.port)], user_info
      end

      defp user_info do
        unquote(smtp_info.userinfo)
          |> String.Chars.to_string
          |> String.split(":")
          |> user_info
      end
      defp user_info([""]) do
        []
      end
      defp user_info([username|password]) do
        [username: username, password: password]
      end

    end
  end

end
