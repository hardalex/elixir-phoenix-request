defmodule Common.Request do
	def json(url) do
	    case HTTPoison.get(url) do
            {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
                {:ok, data} = Poison.decode(body)
            {:error, %HTTPoison.Error{reason: reason}} ->
                data = %{error: reason}
        end
        data
	end
    def json(url, body) do
        case HTTPoison.post(url, body, [{"Accept", "application/json"}, {"Content-Type", "application/json"}]) do
            {:ok, %HTTPoison.Response{status_code: _, body: body}} ->
                {:ok, data} = Poison.decode(body)
            {:error, %HTTPoison.Error{reason: reason}} ->
                data = %{error: reason}
        end
        data
    end
end
