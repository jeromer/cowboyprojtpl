-module(cowboyprojtpl_example_SUITE).

%% ct.
-export([all/0]).
-export([init_per_suite/1]).
-export([end_per_suite/1]).
-export([init_per_testcase/2]).
-export([end_per_testcase/2]).

% tests
-export([check_example_success/1]).
-export([check_example_failure/1]).

-include_lib("common_test/include/ct.hrl").

%% --------------------------------

all() -> [
    check_example_success,
    check_example_failure
].

init_per_suite(Config) ->
    Config.

end_per_suite(Config) ->
    Config.

init_per_testcase(_TestCase, Config) ->
    Config.

end_per_testcase(_TestCase, Config) ->
    Config.

% -----------------------------------------

check_example_success(_Config) ->
    2 = 2.

check_example_failure(_) ->
    true = os:timestamp().
