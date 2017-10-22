defmodule Short.Short.Url do
  use Ecto.Schema
  import Ecto.Changeset
  alias Short.Short.Url


  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "urls" do
    field :href, :string

    timestamps()
  end

  @doc false
  def changeset(%Url{} = url, attrs) do
    url
    |> cast(attrs, [:href])
    |> validate_required([:href])
  end
end
