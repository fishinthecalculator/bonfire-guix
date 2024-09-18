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

(define-public erlang-cowboy
  (package
    (name "erlang-cowboy")
    (version "2.12.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "cowboy" version))
       (sha256
        (base32 "07k5hbprnqvi2ym12fcaw5r2par8r6z0j9xa3jrcwwik31nvwyla"))))
    (build-system rebar-build-system)
    (propagated-inputs (list erlang-cowlib erlang-ranch))
    (synopsis "Small, fast, modern HTTP server")
    (description "Cowboy aims to provide a complete HTTP stack in a small code
base.  It is optimized for low latency and low memory usage, in part because it
uses binary strings.

Cowboy provides routing capabilities, selectively dispatching requests to
handlers written in Erlang.  Because it uses Ranch for managing connections,
Cowboy can easily be embedded in any other application.")
    (home-page "https://hex.pm/packages/cowboy")
    (license license:isc)))

(define-public erlang-cowlib
  (package
    (name "erlang-cowlib")
    (version "2.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "cowlib" version))
       (sha256
        (base32 "1900723lif54319q2sr4qd3dm6byms1863ddn5j0l0zwqd6jiqg1"))))
    (build-system rebar-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list erlang-proper))
    (synopsis "Manipulate Web protocols")
    (description "This package provides @code{erlang-cowlib}, a support library
for manipulating Web protocols.")
    (home-page "https://hex.pm/packages/cowlib")
    (license license:isc)))

(define-public erlang-proper
  (package
    (name "erlang-proper")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "proper" version))
       (sha256
        (base32 "1fwcas4a9kz3w3z1jqdk9lw8822srfjk9lcpvbxkxlsv3115ha0q"))))
    (build-system rebar-build-system)
    (synopsis "Property-based testing tool for Erlang")
    (description
     "This package provides a @code{QuickCheck-inspired} property-based testing tool
for Erlang.")
    (home-page "https://hexdocs.pm/proper/")
    (license license:gpl3+)))

(define-public erlang-ranch
  (package
    (name "erlang-ranch")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ranch" version))
       (sha256
        (base32 "05k9wxwi8fw0izg5f41j98lpdg4xzlj91i8ziq6jfxb15bxf6ki4"))))
    (build-system rebar-build-system)
    (synopsis "Socket acceptor pool for TCP protocols.")
    (description "Ranch aims to provide everything you need to accept TCP
connections with a small code base and low latency while being easy to use
directly as an application or to embed into your own.")
    (home-page "https://hex.pm/packages/ranch")
    (license license:isc)))

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
