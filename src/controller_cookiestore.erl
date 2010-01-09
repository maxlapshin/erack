-module(controller_cookiestore, [Key, Secret]).

-export([call/2]).
-behaviour(rack_handler).

call(App, Request) ->
  Reply = case proplists:get_value(Key, Request) of
    undefined -> App:call(Request);
    Cookie -> App:call(lists:keystore('rack.session', 1, Request, {'rack.session', decode(Cookie)}))
  end,
  NewCookie = encode(extract_session(Reply)),
  Reply:set_cookie(Key, NewCookie).

decode(A) -> A.
extract_session(A) -> A.
encode(A) -> A.