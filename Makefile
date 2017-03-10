PROJECT             = cowboyprojtpl
PROJECT_DESCRIPTION = Cowboy project template
PROJECT_VERSION     = git

# ---------------------------------------------------------

SHELL_OPTS = -sname $(PROJECT)                                  \
			 -eval 'application:ensure_all_started($(PROJECT))' \
			 -setcookie $(PROJECT)                              \
			 -config dev.config                                 \

# ---------------------------------------------------------

DEPS = cowboy statsderl pgsql jsx lager

dep_cowboy_commit    = 1.0.4
dep_statsderl_commit = 0.5.2
dep_pgsql_commit     = v26.0.1
dep_jsx_commit       = v2.8.2

dep_lager = git https://github.com/erlang-lager/lager.git 3.3.0

# ---------------------------------------------------------

TEST_DEPS = cth_readable

dep_cth_readable = git https://github.com/ferd/cth_readable.git v1.1.1

# ---------------------------------------------------------

include erlang.mk

# ---------------------------------------------------------

ERLC_OPTS += +'{parse_transform, lager_transform}'

# ---------------------------------------------------------

TEST_ERLC_OPTS += +'{parse_transform, cth_readable_transform}'

CT_OPTS = -ct_hooks cth_surefire and          \
		            cth_readable_failonly and \
					cth_readable_shell and    \
					cth_bootstrap
