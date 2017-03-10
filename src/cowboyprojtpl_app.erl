-module(cowboyprojtpl_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

-include("cowboy_opts.hrl").

start(_Type, _Args) ->
    ProtoOpts = [
        {env, [{dispatch, cowboy_router:compile(?COWBOY_ROUTES)}]},
        {middlewares, [cowboy_router, cowboy_handler]}
    ],

    ListenerOpts = [
        {port, cfg_get(http, port)}
    ],

    cowboy:start_http(http_listener, 100, ListenerOpts, ProtoOpts),

	cowboyprojtpl_sup:start_link().

stop(_State) ->
	ok.

% ---------------------------------------------------------

cfg_get(Group, Var) ->
    {ok, Values} = application:get_env(cowboyprojtpl, Group),
    {Var, Value} = proplists:lookup(Var, Values),
    Value.
