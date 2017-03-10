% public --------------------------------------------------

-define(PROBE_INCR(P),           ?INCR(?PROBE_GET(P))).
-define(PROBE_INCR_FMT(P, Args), ?INCR(?PROBE_FMT(P, Args))).

-define(PROBE_GAUGE(P, V),           ?GAUGE(?PROBE_GET(P), V)).
-define(PROBE_GAUGE_FMT(P, Args, V), ?GAUGE(?PROBE_FMT(P, Args), V)).

-define(PROBE_TIMING(P, TS), ?TIMING(?PROBE_GET(P), TS)).

% private -------------------------------------------------

-define(PROBE_GET(P), cowboyprojtpl_statsd_probes:get(?MODULE, P)).
-define(PROBE_FMT(P, Args), io_lib:format(?PROBE_GET(P), Args)).

-define(INCR(P), statsderl:increment(P, 1, 1.0)).
-define(GAUGE(P, V), statsderl:gauge(P, V, 1.0)).
-define(TIMING(P, TS), statsderl:timing_now(P, TS, 1.0)).
