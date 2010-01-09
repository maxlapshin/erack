-module(example_server).

-export([rack_config/0]).
-behaviour(rack_config).


rack_config() ->
  [
    controller_failsafe,
    controller_cookiestore:new("secretstring", "_example_session")
  ].