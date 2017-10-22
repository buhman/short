defmodule ShortWeb.UrlControllerTest do
  use ShortWeb.ConnCase

  alias Short.Short
  alias Short.Short.Url

  @create_attrs %{href: "some href"}
  @update_attrs %{href: "some updated href"}
  @invalid_attrs %{href: nil}

  def fixture(:url) do
    {:ok, url} = Short.create_url(@create_attrs)
    url
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all urls", %{conn: conn} do
      conn = get conn, url_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create url" do
    test "renders url when data is valid", %{conn: conn} do
      conn = post conn, url_path(conn, :create), url: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, url_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "href" => "some href"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, url_path(conn, :create), url: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update url" do
    setup [:create_url]

    test "renders url when data is valid", %{conn: conn, url: %Url{id: id} = url} do
      conn = put conn, url_path(conn, :update, url), url: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, url_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "href" => "some updated href"}
    end

    test "renders errors when data is invalid", %{conn: conn, url: url} do
      conn = put conn, url_path(conn, :update, url), url: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete url" do
    setup [:create_url]

    test "deletes chosen url", %{conn: conn, url: url} do
      conn = delete conn, url_path(conn, :delete, url)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, url_path(conn, :show, url)
      end
    end
  end

  defp create_url(_) do
    url = fixture(:url)
    {:ok, url: url}
  end
end
