% http://erlang.org/doc/apps/common_test/ct_hooks_chapter.html
-module(cth_bootstrap).

-export([init/2]).

init(_, _) ->
    ok.
