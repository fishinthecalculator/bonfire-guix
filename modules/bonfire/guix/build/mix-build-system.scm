;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire guix build mix-build-system)
  #:use-module ((guix build mix-build-system) #:prefix mix:)
  #:use-module (guix build utils)
  #:use-module (ice-9 match)
  #:export (mix-build
            %standard-phases))

(define* (set-erl-env #:key inputs #:allow-other-keys)
  "Set environment variables.
See: https://hexdocs.pm/mix/1.15.7/Mix.html#module-environment-variables"
  (setenv "ERL_LIBS"
          (string-join
           (search-path-as-list '("lib/erlang/lib")
                                (map (match-lambda
                                       ((label . package) package))
                                     inputs))
           ":") ))

(define %standard-phases
  (modify-phases mix:%standard-phases
    (add-after 'set-mix-env 'set-erl-env set-erl-env)))

(define* (mix-build #:key inputs (phases %standard-phases)
                    #:allow-other-keys #:rest args)
  "Build the given Mix package, applying all of PHASES in order."
  (apply mix:mix-build #:inputs inputs #:phases phases args))
