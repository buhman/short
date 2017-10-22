defmodule ShortWeb.UrlController do
  use ShortWeb, :controller

  alias Short.Short
  alias Short.Short.Url

  action_fallback ShortWeb.FallbackController

  def index(conn, _params) do
    urls = Short.list_urls()
    render(conn, "index.json", urls: urls)
  end

  def create(conn, %{"url" => url_params}) do
    with {:ok, %Url{} = url} <- Short.create_url(url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", url_path(conn, :show, url))
      |> render("show.json", url: url)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Short.get_url!(id)
    render(conn, "show.json", url: url)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = Short.get_url!(id)

    with {:ok, %Url{} = url} <- Short.update_url(url, url_params) do
      render(conn, "show.json", url: url)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = Short.get_url!(id)
    with {:ok, %Url{}} <- Short.delete_url(url) do
      send_resp(conn, :no_content, "")
    end
  end
end
