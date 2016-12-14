defmodule Common.Request do
    def json(url) do
        {:ok, data} =
            case HTTPoison.get(url) do
                {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
                    Poison.decode(body)
                {:error, %HTTPoison.Error{reason: reason}} ->
                    {:ok, %{error: reason}}
            end
        data
    end
    def json(url, body) do
        {:ok, data} =
            case HTTPoison.post(url, body, [{"Accept", "application/json"}, {"Content-Type", "application/json"}]) do
                {:ok, %HTTPoison.Response{status_code: _, body: body}} ->
                    Poison.decode(body)
                {:error, %HTTPoison.Error{reason: reason}} ->
                    {:ok, %{error: reason}}
            end
        data
    end
end
