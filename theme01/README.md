# Gotham

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix


list of commands before running the app

mix ecto.create
mix ecto.migrate

mix run priv/repo/seeds/user_seed.exs 
mix run priv/repo/seeds/workingtimes_seed.exs 

Then run the server
mix phx.server
VO.1
Working : CRUD on users
To be done
WorkingTime routes, Clock routes.