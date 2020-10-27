use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :gotham, Gotham.Repo,
  username: "postgres",
  password: "postgres",
  database: "gotham_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gotham, GothamWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :junit_formatter,
  report_file: "test.xml",
  report_dir: "./",
  print_report_file: true,
  prepend_project_name?: true
