defmodule Gotham.Export do
  @moduledoc """
  The Export context.
  """

  import Ecto.Query, warn: false
  alias Gotham.Repo

  alias Gotham.Export.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """

  def get_user_by_mail_name!(params) do
    from(u in User, where: u.username == ^params["username"] and u.email == ^params["email"])
    |> Repo.one
  end

  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
  @moduledoc """
  The Export context.
  """

  import Ecto.Query, warn: false
  alias Gotham.Repo

  alias Gotham.Export.Clock

  @doc """
  Returns the list of clocks.

  ## Examples

      iex> list_clocks()
      [%Clock{}, ...]

  """
  def list_clocks do
    Repo.all(Clock)
  end

  @doc """
  Gets a single clock.

  Raises `Ecto.NoResultsError` if the Clock does not exist.

  ## Examples

      iex> get_clock!(123)
      %Clock{}

      iex> get_clock!(456)
      ** (Ecto.NoResultsError)

  """
  #get clock
  def get_clock!(id), do: Repo.get!(Clock, id)
  def get_clocks_by_user_id!(user_id), do: Repo.all(from c in Clock, where: c.user_id == ^user_id)

  @doc """
  Creates a clock.

  ## Examples

      iex> create_clock(%{field: value})
      {:ok, %Clock{}}

      iex> create_clock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clock(attrs \\ %{}) do
    %Clock{}
    |> Clock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clock.

  ## Examples

      iex> update_clock(clock, %{field: new_value})
      {:ok, %Clock{}}

      iex> update_clock(clock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clock.

  ## Examples

      iex> delete_clock(clock)
      {:ok, %Clock{}}

      iex> delete_clock(clock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clock changes.

  ## Examples

      iex> change_clock(clock)
      %Ecto.Changeset{data: %Clock{}}

  """
  def change_clock(%Clock{} = clock, attrs \\ %{}) do
    Clock.changeset(clock, attrs)
  end

  alias Gotham.Export.Workingtimes

  @doc """
  Returns the list of workingtimes.

  ## Examples

      iex> list_workingtimes()
      [%Workingtimes{}, ...]

  """
  def list_workingtimes do
    from(w in Workingtime)
    |> Repo.all(Workingtimes)
  end

  def get_workingtime_by_end_start!(params) do
    from(u in Workingtimes, where: u.user_id ==^params["user_id"] and( u.end == ^params["end"] or u.start == ^params["start"]))   #### get ALL 
    |> Repo.all()
  end

  @doc """
  Gets a single workingtimes.

  Raises `Ecto.NoResultsError` if the Workingtimes does not exist.

  ## Examples

      iex> get_workingtimes!(123)
      %Workingtimes{}

      iex> get_workingtimes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_workingtimes!(id), do: Repo.get!(Workingtimes, id)

  def get_oneworkingtimes!(params) do
    from(w in Workingtimes, where: w.user_id == ^params["user_id"] and w.id == ^params["id"])
    |> Repo.one
  end

  @doc """
  Creates a workingtimes.

  ## Examples

      iex> create_workingtimes(%{field: value})
      {:ok, %Workingtimes{}}

      iex> create_workingtimes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  

  def create_workingtimes(attrs \\ %{}) do
    %Workingtimes{}
    |> Workingtimes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a workingtimes.

  ## Examples

      iex> update_workingtimes(workingtimes, %{field: new_value})
      {:ok, %Workingtimes{}}

      iex> update_workingtimes(workingtimes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_workingtimes(%Workingtimes{} = workingtimes, attrs) do
    workingtimes
    |> Workingtimes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a workingtimes.

  ## Examples

      iex> delete_workingtimes(workingtimes)
      {:ok, %Workingtimes{}}

      iex> delete_workingtimes(workingtimes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_workingtimes(%Workingtimes{} = workingtimes) do
    Repo.delete(workingtimes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking workingtimes changes.

  ## Examples

      iex> change_workingtimes(workingtimes)
      %Ecto.Changeset{data: %Workingtimes{}}

  """
  def change_workingtimes(%Workingtimes{} = workingtimes, attrs \\ %{}) do
    Workingtimes.changeset(workingtimes, attrs)
  end
end
