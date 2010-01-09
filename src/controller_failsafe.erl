-module(controller_failsafe).

-export([call/2]).

-behaviour(rack_handler).

call(App, Request) ->
  try App:call(Request) of
    Reply -> Reply
  catch
    error:notfound -> [404, [{"Content-Type", "text/plain"}], "404 Not found"];
    _:_ -> [500, [{"Content-Type", "text/plain"}], "500 Server error"++lists:flatten(io_lib:format("~n~p~n", [erlang:get_stacktrace()]))]
  end.
