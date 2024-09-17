;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire guix build mix-build-system)
  #:use-module ((guix build mix-build-system) #:prefix mix:)
  #:use-module (guix build utils)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:export (mix-build
            %standard-phases))

(define* (elixir-libdir path #:optional (version #f))
  "Return the path where all libraries under PATH for a specified Elixir
VERSION are installed."
  (string-append path "/lib/elixir/" version))

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

;;; This is the code to be upstreamed.

(define* (set-erl-env #:key inputs #:allow-other-keys)
  "Set environment variables.
See: https://hexdocs.pm/mix/1.15.7/Mix.html#module-environment-variables"
  (setenv "ERL_LIBS"
          (string-join
           (search-path-as-list `("lib/erlang/lib"
                                  ,(string-drop
                                    (elixir-libdir "" (elixir-version inputs))
                                    1))
                                (map (match-lambda
                                       ((label . package) package))
                                     inputs))
           ":") ))

(define %standard-phases
  (modify-phases mix:%standard-phases
    (add-after 'set-elixir-version 'set-erl-env set-erl-env)))

(define* (mix-build #:key inputs (phases %standard-phases)
                    #:allow-other-keys #:rest args)
  "Build the given Mix package, applying all of PHASES in order."
  (apply mix:mix-build #:inputs inputs #:phases phases args))
