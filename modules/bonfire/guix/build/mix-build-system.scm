;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire guix build mix-build-system)
  #:use-module ((guix build mix-build-system) #:prefix mix:)
  #:use-module (guix build utils)
  #:use-module (ice-9 match)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 string-fun)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:export (mix-build
            %standard-phases))

(define* (elixir-libdir path #:optional (version #f))
  "Return the path where all libraries under PATH for a specified Elixir
VERSION are installed."
  (string-append path "/lib/elixir/" version))

(define (mix-build-dir mix-build-root mix-env)
  "Return the directory where build artifacts are to be installed according to
en environment MIX-ENV in the current directory.  MIX-BUILD-ROOT depends on the
package arguments.  See: https://hexdocs.pm/mix/1.15/Mix.html#module-environment-variables"
  (string-append mix-build-root "/" mix-env "/lib"))

(define* (strip-prefix name #:optional (prefix "elixir-"))
  "Return NAME without the prefix PREFIX."
  (if (string-prefix? prefix name)
      (string-drop name (string-length prefix))
      name))

(define (elixir-version inputs)
  "Return an X.Y string where X and Y are respectively the major and minor version number of PACKAGE.
Example: /gnu/store/…-elixir-1.14.0 → 1.14"
  ((compose
    (cute string-join <> ".")
    (cute take <> 2)
    (cute string-split <> #\.)
    strip-prefix
    strip-store-file-name)
   (assoc-ref inputs "elixir")))

(define* (install #:key
                  inputs
                  outputs
                  name
                  build-per-environment
                  #:allow-other-keys)
  "Install build artifacts in the store."
  (let* ((lib-name (package-name->elixir-name name))
         (lib-dir (string-append (elixir-libdir (assoc-ref outputs "out")
                                                (elixir-version inputs)) "/" lib-name))
         (root (getenv "MIX_BUILD_ROOT"))
         (env (if build-per-environment "prod" "shared")))
    (mkdir-p lib-dir)
    (copy-recursively (string-append (mix-build-dir root env) "/" lib-name) lib-dir
                      #:follow-symlinks? #t)))

;;; This is the code to be upstreamed.

(define %git-version-rx
  (make-regexp "^(.*)-[0-9]+(\\.[0-9]+)?(\\.[0-9]+)?-[0-9]+\\..+$"))

(define (package-name->elixir-name name+ver)
  "Convert the Guix package NAME-VER to the corresponding Elixir name-version
format.  Example: elixir-a-pkg-1.2.3 -> a_pkg or a_pkg-0.0.0-0.e51e36e -> a_pkg"
  (define git-version? (regexp-exec %git-version-rx name+ver))
  ((compose
    (cute string-join <> "_")
    (cute drop-right <> (if git-version? 2 1))
    (cute string-split <> #\-))
   (strip-prefix name+ver)))

(define* (set-erl-env #:key inputs #:allow-other-keys)
  "Show Erlang dependencies in Elixir's load path."
  (setenv "ERL_LIBS"
          (string-join
           (search-path-as-list `("lib/erlang/lib")
                                (map (match-lambda
                                       ((label . package) package))
                                     inputs))
           ":") ))


(define %standard-phases
  (modify-phases mix:%standard-phases
    (replace 'install install)
    (add-after 'set-elixir-version 'set-erl-env set-erl-env)))

(define* (mix-build #:key inputs (phases %standard-phases)
                    #:allow-other-keys #:rest args)
  "Build the given Mix package, applying all of PHASES in order."
  (apply mix:mix-build #:inputs inputs #:phases phases args))
