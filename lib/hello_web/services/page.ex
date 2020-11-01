defmodule Service.Page do
  use HTTPoison.Base, Poison

  def getFromURL(url) do
    response = HTTPoison.get!(url)
    Poison.decode!(response.body) |> Kernel.inspect()
    # IO.inspect(response)
  end

  def countChar(str) do
    # IO.inspect(str)
    # IO.inspect(IEx.Info.info(str))
    slc = String.graphemes(str)

    map =
      Enum.reduce(slc, %{}, fn x, ch ->
        if Map.has_key?(ch, x) do
          %{ch | x => ch[x] + 1}
        else
          Map.put(ch, x, 1)
        end
      end)

    IO.inspect(map)
    map
  end
end
