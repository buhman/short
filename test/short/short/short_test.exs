defmodule Short.ShortTest do
  use Short.DataCase

  alias Short.Short

  describe "urls" do
    alias Short.Short.Url

    @valid_attrs %{href: "some href"}
    @update_attrs %{href: "some updated href"}
    @invalid_attrs %{href: nil}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Short.create_url()

      url
    end

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Short.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Short.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %Url{} = url} = Short.create_url(@valid_attrs)
      assert url.href == "some href"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Short.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      assert {:ok, url} = Short.update_url(url, @update_attrs)
      assert %Url{} = url
      assert url.href == "some updated href"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Short.update_url(url, @invalid_attrs)
      assert url == Short.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Short.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Short.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Short.change_url(url)
    end
  end
end
