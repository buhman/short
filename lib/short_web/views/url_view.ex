defmodule ShortWeb.UrlView do
  use ShortWeb, :view
  alias ShortWeb.UrlView

  def render("index.json", %{urls: urls}) do
    %{data: render_many(urls, UrlView, "url.json")}
  end

  def render("show.json", %{url: url}) do
    %{data: render_one(url, UrlView, "url.json")}
  end

  def render("url.json", %{url: url}) do
    %{id: url.id,
      href: url.href}
  end
end
