# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :wiki_elixir,
  user_agent: "wiki_elixir/0.1.4 (spam@ludd.net)",
  ores: "https://ores.wikimedia.org/v3/scores/",
  wikimedia_org: "https://wikimedia.org/api/rest_v1",
  eventstreams_base: "https://stream.wikimedia.org/v2/stream/",

  # FIXME: per-wiki
  default_site_api: "https://en.wikipedia.org/w/api.php",
  username: "bot_username",
  password: "bot_password"

# FIXME: Configure in a way that's easier to override from calling applications?
config :tesla,
  adapter: Tesla.Adapter.Hackney

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# third-party users, it should be done in your "mix.exs" file.

# You can configure your application as:
#
#     config :elixir, key: :value
#
# and access this configuration in your application as:
#
#     Application.get_env(:elixir, :key)
#
# You can also configure a third-party app:
#
#     config :logger, level: :info
#

if Mix.env() != :prod do
  config :git_hooks,
    verbose: true,
    hooks: [
      pre_push: [
        tasks: [
          "mix clean",
          "mix compile --warnings-as-errors",
          "mix format --check-formatted",
          "mix credo --strict",
          "mix test",
          "mix coveralls",
          "mix dialyzer",
          "mix doctor"
        ]
      ]
    ]
end

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
import_config "#{Mix.env()}.exs"
