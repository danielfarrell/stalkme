defmodule Mailme.Builder do

  def build(opts) do
    {opts[:from], [opts[:to]], headers(opts) <> opts[:body]}
  end

  defp headers(opts) do
    "Subject: #{opts[:subject]}\r\nFrom: #{opts[:from]} \r\nTo: #{opts[:to]} \r\n\r\n"
  end

end
