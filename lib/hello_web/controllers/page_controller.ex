defmodule HelloWeb.PageController do
  use HelloWeb, :controller
  import Service.Page

  def index(conn, _params) do
    # IO.inspect(conn.query_params)
    map =
      if Map.has_key?(conn.query_params, "url") do
        url = conn.query_params["url"]

        if String.starts_with?(url, "http") do
          # if input is http link
          getFromURL(conn.query_params["url"]) |> countChar()
        else
          # otherwise treat it like text
          countChar(url)
        end
      end

    render(conn, "index.html", url: conn.query_params["url"], map: map)
  end
end
