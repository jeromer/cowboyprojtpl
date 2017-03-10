-module(cowboyprojtpl_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {}).

-include("statsd_probe_helpers.hrl").

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
    TS = os:timestamp(),
    log_messages(),

    ?PROBE_INCR(some_counter),
    ?PROBE_GAUGE(some_gauge, 10),
    ?PROBE_INCR_FMT(fmt_example, [foo]),

    Headers = [
        {<<"content-type">>, <<"application/json">>}
    ],

    Body = jsx:encode([
        {<<"version">>, version_string()},
        {<<"now">>, date_time_from_db()}
    ]),

    {ok, Req2} = cowboy_req:reply(200, Headers, Body, Req),

    ?PROBE_TIMING(some_timer, TS),

    {ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.

% ---------------------------------------------------------

version_string() ->
    {ok, Vsn} = application:get_key(cowboyprojtpl, vsn),
    {ok, Id} = application:get_key(cowboyprojtpl, id),
    list_to_binary(io_lib:format("~s/~s", [Vsn, Id])).

log_messages() ->
    lager:debug("foo"),
    lager:info("foo"),
    lager:notice("foo"),
    lager:warning("foo"),
    lager:error("foo"),
    lager:critical("foo"),
    lager:alert("foo"),
    lager:emergency("foo").

date_time_from_db() ->
    % XXX : the DB connection should be shared among handlers.
    % XXX : is it left here as an example
    {ok, Options} = application:get_env(cowboyprojtpl, db),
    Conn = pgsql_connection:open(Options),
    {{select, 1}, [{DateTime}]} = pgsql_connection:simple_query("SELECT NOW();", Conn),
    DateTime.

% ---------------------------------------------------------

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

example_test() ->
    ?assert(length([1,2,3]) =:= 3).

-endif.

