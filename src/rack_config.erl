-module(rack_config).
-export([behaviour_info/1]).

behaviour_info(callbacks) -> [{rack_config, 0}];
behaviour_info(_Other) -> undefined.
