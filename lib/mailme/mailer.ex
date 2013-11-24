defmodule Mailme.Mailer do

  @doc false
  defmacro __using__(mailer_opts) do
    URI.default_port "smtp", 25
    smtp_info = System.get_env("SMTP_URL") |> URI.parse

    quote do
      def send(opts) do
        opts = Keyword.merge(unquote(mailer_opts), opts)
        email = {opts[:from], [opts[:to]], headers(opts) <> opts[:body]}
        :gen_smtp_client.send(email, send_info)
      end

      def render(template, opts) do
        EEx.eval_file "web/templates/" <> template <> ".text.eex", opts
      end

      defp headers(opts) do
        "Subject: #{opts[:subject]}\r\nFrom: #{opts[:from]} \r\nTo: #{opts[:to]} \r\n\r\n"
      end

      defp send_info do
        Keyword.merge [relay: unquote(smtp_info.host), port: unquote(smtp_info.port)], user_info
      end

      defp user_info do
        unquote(smtp_info.userinfo) |> String.Chars.to_string |> String.split(":") |> user_info
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
