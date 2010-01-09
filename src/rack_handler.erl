-module(rack_handler).
-export([behaviour_info/1]).

behaviour_info(callbacks) -> [{call, 2}];
behaviour_info(_Other) -> undefined.
