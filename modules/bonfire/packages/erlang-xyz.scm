;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages erlang-xyz)
  #:use-module (gnu packages erlang-xyz)
  #:use-module (guix build-system rebar)
  #:use-module (guix download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages))

(define-public erlang-telemetry
  (package
    (name "erlang-telemetry")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "telemetry" version))
       (sha256
        (base32 "1rkrbf3z7my9dsz9km7077anp6f0nyapmf5lyij3grnv364zq5bh"))))
    (build-system rebar-build-system)
    (synopsis "Dynamic dispatching library for metrics and instrumentations")
    (description
     "@code{Telemetry} is a lightweight library for dynamic dispatching of
events, with a focus on metrics and instrumentation.  Any Erlang or Elixir
library can use @code{telemetry} to emit events.  Application code and other
libraries can then hook into those events and run custom handlers.")
    (home-page "https://hexdocs.pm/telemetry/")
    (license license:asl2.0)))
