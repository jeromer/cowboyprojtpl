-module(cowboyprojtpl_statsd_probes).

-export([get/2]).

-define(PROBES, [
    {cowboyprojtpl_handler, [
        {some_counter, <<"cowboyprojtpl_handler.some_counter">>},
        {some_gauge, <<"cowboyprojtpl_handler.some_gauge">>},
        {some_timer, <<"cowboyprojtpl_handler.some_timer">>},
        {fmt_example, <<"cowboyprojtpl_handler.fmt_example.~s">>}
    ]}
]).

-spec get(ModuleName::atom(), ProbeName::atom()) -> binary().
get(ModuleName, ProbeName) when is_atom(ModuleName) andalso is_atom(ProbeName) ->
    {ModuleName, Probes} = proplists:lookup(ModuleName, ?PROBES),
    {ProbeName, ProbePath} = proplists:lookup(ProbeName, Probes),
    true = is_binary(ProbePath),
    ProbePath.
