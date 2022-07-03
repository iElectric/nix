# Release X.Y (202?-??-??)

* `<nix/fetchurl.nix>` now accepts an additional argument `impure` which
  defaults to `false`.  If it is set to `true`, the `hash` and `sha256`
  arguments will be ignored and the resulting derivation will have
  `__impure` set to `true`, making it an impure derivation.

* If `builtins.readFile` is called on a file with context, then only the parts
  of that context that appear in the content of the file are retained.
  This avoids a lot of spurious errors where some benign strings end-up having
  a context just because they are read from a store path
  ([#7260](https://github.com/NixOS/nix/pull/7260)).

* You can now use flake references in the old CLI, e.g.

  ```
  # nix-build flake:nixpkgs -A hello
  # nix-build -I nixpkgs=flake:github:NixOS/nixpkgs/nixos-22.05 \
      '<nixpkgs>' -A hello
  # NIX_PATH=nixpkgs=flake:nixpkgs nix-build '<nixpkgs>' -A hello
  ```

* `nix repl` now takes installables on the command line, unifying the usage
  with other commands that use `--file` and `--expr`. Primary breaking change
  is for the common usage of `nix repl '<nixpkgs>'` which can be recovered with
  `nix repl --file '<nixpkgs>'` or `nix repl --expr 'import <nixpkgs>{}'`

  This is currently guarded by the 'repl-flake' experimental feature

* Let expressions returning a trivial value are treated as a trivial
  value in expression evaluation. This allows one, for instance, to
  use a let-expression in the `outputs` attribute of a Flake.

