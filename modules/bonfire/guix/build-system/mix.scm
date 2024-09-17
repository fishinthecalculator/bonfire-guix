;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire guix build-system mix)
  #:use-module ((guix build-system mix) #:prefix mix:)
  #:use-module (bonfire guix build mix-build-system)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system)
  #:use-module (guix gexp)
  #:use-module (guix monads)
  #:use-module (guix packages)
  #:use-module (guix search-paths)
  #:use-module (guix store)
  #:export (mix-build-system hexpm-uri))

;; This is a fork of the Guix mainline mix-build-system. All changes will be
;; upstreamed to Guix itself sooner or later.

(define hexpm-uri mix:hexpm-uri)

(define* (mix-build name
                    inputs
                    #:key
                    source
                    (tests? #t)
                    (mix-path #f) ;See MIX_PATH.
                    (mix-exs "mix.exs") ;See MIX_EXS.
                    (build-per-environment #t) ;See :build_per_environment.
                    (phases '%standard-phases)
                    (outputs '("out"))
                    (search-paths '())
                    (system (%current-system))
                    (guile #f)
                    (imported-modules `((bonfire guix build mix-build-system)
                                        (guix build mix-build-system)
                                        ,@%default-gnu-imported-modules))
                    (modules '((bonfire guix build mix-build-system)
                               (guix build utils))))
  "Build SOURCE using Elixir, and with INPUTS."

  ;; Check the documentation of :build_per_environment here:
  ;; https://hexdocs.pm/mix/1.15.7/Mix.Project.html#module-configuration And
  ;; "Environments" here:
  ;; https://hexdocs.pm/mix/1.15.7/Mix.html#module-environments
  (define mix-environments
    (if build-per-environment
        `("prod" ,@(if tests? '("test") '()))
        '("shared")))

  (define builder
    (with-imported-modules imported-modules
      #~(begin

          (use-modules #$@(sexp->gexp modules))

          #$(with-build-variables inputs outputs
              #~(mix-build #:name #$name
                           #:source #+source
                           #:system #$system
                           #:tests? #$tests?
                           #:mix-path #$mix-path
                           #:mix-exs #$mix-exs
                           #:mix-environments '#$mix-environments
                           #:build-per-environment #$build-per-environment
                           #:phases #$(if (pair? phases)
                                          (sexp->gexp phases)
                                          phases)
                           #:outputs %outputs
                           #:search-paths '#$(sexp->gexp
                                              (map
                                               search-path-specification->sexp
                                               search-paths))
                           #:inputs
                           %build-inputs)))))

  (mlet %store-monad ((guile (package->derivation (or guile (default-guile))
                                                  system
                                                  #:graft? #f)))
    (gexp->derivation name
                      builder
                      #:system system
                      #:graft? #f       ;consistent with 'gnu-build'
                      #:target #f
                      #:guile-for-build guile)))

(define mainline-lower
  (build-system-lower
   mix:mix-build-system))

(define lower
  (lambda args
  "Return a bag for NAME."
    (let ((mainline-bag
           (apply mainline-lower args)))
      (bag (inherit mainline-bag)
           (build mix-build)))))

(define mix-build-system
  (build-system (name 'mix)
                (description "The standard Mix build system")
                (lower lower)))
