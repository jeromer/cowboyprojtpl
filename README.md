Cowboy project template
=======================

It targets people who actually heard about cowboy and/or erlang but never
actually tried to do anything with it for various reasons.

It also acts as a reference for me when I need to start a new project with
cowboy from scratch.

It uses the following libraries:

* [cth_readable 1.1.1](https://github.com/ferd/cth_readable/tree/v1.1.1)
* [jsx 2.8.2](https://github.com/talentdeficit/jsx/tree/v2.8.2)
* [pgsql 26.0.1](https://github.com/semiocast/pgsql/tree/v26.0.1)
* [statsderl 0.5.2](https://github.com/lpgauth/statsderl/tree/0.5.2)
* [cowboy 1.0.4](https://github.com/ninenines/cowboy/tree/1.0.4)

As well as [erlang.mk 2016.01.12-1-ge0ebd0a](https://erlang.mk/)

Maybe in the future I will include:

* [exometer](https://github.com/Feuerlabs/exometer_core)
* [cowolg](https://github.com/jeromer/cowolg)

Features
--------

This project provides:

* macro helpers + module for using statsd
* contrived postgres querying
* lager logging examples
* one eunit example in `src/cowboyprojtpl_handler.erl`
* a very contrived cowboy http handler using statsd probes, postgreql querying,
  lager logs and jsx. Have a look in `src/cowboyprojtpl_handler.erl`
* a few [common test](http://erlang.org/doc/apps/common_test/users_guide.html)
  examples
* `.gitignore` configuration
* `.gitattributes` configration so erlang.mk is treated as a binary file
  (useful when upgrading erlang.mk)

All in all this project will save a LOT of time for anyone who wants to
discover cowboy and/or Erlang.

Building the project
--------------------

Run `make deps app shell` and point your browser to http://localhost:8080/ .
You should get a simplistic JSON response.

Configuration
-------------

This project can be configured in either `src/cowboyprojtpl.app.src` or
`dev.config` depending on what you want to change.

Running tests
-------------

Run `make tests`. This will run eunit and common test tests.

For eunit test only, run `make eunit` or `make eunit EUNIT_OPTS=verbose`.

For common test run `make ct`.
