;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages erlang-xyz)
  #:use-module (gnu packages erlang)
  #:use-module (guix build-system rebar)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire utils))

(define-public erlang-binpp
  (package
    (name "erlang-binpp")
    (version "1.1.1")
    (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/jtendo/binpp.git")
               (commit version)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1dv7mg0j6q4vs4bcp14df3q1y3if58dskca98wmnsrbwkibkn6vp"))
         (patches (bonfire-search-patches "erlang-binpp-disable-failing-tests.patch"))))
    (build-system rebar-build-system)
    (synopsis "Erlang Binary Pretty Printer")
    (description "@code{Binpp} will use @code{io:format} to output the formatted
binary by default.  However there are options making @code{pprint} functions
return formatted data instead of performing direct IO write.")
    (home-page "https://hexdocs.pm/binpp/")
    (license license:wtfpl2)))

(define-public erlang-coveralls
  (package
    (name "erlang-coveralls")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "coveralls" version))
       (sha256
        (base32 "18q4c8bcrpa48mvwpwdh51ma84zfxhcmd70qh2956jy6m05dnm6d"))))
    (build-system rebar-build-system)
    (inputs (list erlang-jsx))
    (synopsis "Coveralls for Erlang")
    (description "This package provides @code{erlang-coveralls}, an Erlang
module to convert and send cover data to Coveralls.")
    (home-page "https://hex.pm/packages/coveralls")
    (license license:bsd-2)))

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
