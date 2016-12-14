# elixir-phoenix-request
##Require
```elixir
#./mix.exs
def application do
  [
    applications: [
      #...
        :httpoison,
      #...
    ]
  ]
end
defp deps do
  [
    #...  
    {:poison, ">= 0.0.0"},
    {:httpoison, "~> 0.10.0"},
    #...  
  ]
end
```

##Example
```elixir
alias Common.Request
#...

#Example 1
data = Request.json("http://0.0.0.0:9200/index/_search")

#Example 2
query = %{
  query: %{
    bool: %{
      should: [%{term: %{field_1: 1}}]
    }
  },
  sort: [%{_score: "desc"}]
};
data = Request.json("http://0.0.0.0:9200/index/_search", Poison.encode!(query))

#...
conn
  |> put_status(200)
  |> json(data)
```
