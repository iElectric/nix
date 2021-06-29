nix_tests = user-envs.sh

install-tests += $(foreach x, $(nix_tests), tests/$(x))

tests-environment = NIX_REMOTE= $(bash) -e

clean-files += $(d)/common.sh $(d)/config.nix $(d)/ca/config.nix

test-deps += tests/common.sh tests/config.nix tests/ca/config.nix tests/plugins/libplugintest.$(SO_EXT)
