defmodule Dotenv do

  def load do
    contents = load_file ".env"
    lines = contents |> String.split("\n")
    Enum.each lines, fn (line) ->
      line |> put_env
    end
  end

  defp load_file(filename) do
    case File.read filename do
      {:ok, contents} ->
        contents
      {:error, :enoent} ->
        ""
    end
  end

  defp put_env(string) when is_binary(string), do: string |> String.split("=") |> put_env
  defp put_env([""]), do: ""
  defp put_env([key|val]) do
    System.put_env(key, val |> Enum.first)
  end

end
