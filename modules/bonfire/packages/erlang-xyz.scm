;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages erlang-xyz)
  #:use-module (gnu packages erlang)
  #:use-module (gnu packages erlang-xyz)
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
    (propagated-inputs (list erlang-jsx))
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

(define-public erlang-cowboy-telemetry
  (package
    (name "erlang-cowboy-telemetry")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "cowboy_telemetry" version))
       (sha256
        (base32 "1pn90is3k9dq64wbijvzkqb6ldfqvwiqi7ymc8dx6ra5xv0vm63x"))))
    (build-system rebar-build-system)
    (propagated-inputs (list erlang-cowboy erlang-telemetry))
    (synopsis "Telemetry instrumentation for Cowboy")
    (description "This package provides @code{erlang-cowboy-telemetry}, a
library implementing Telemetry instrumentation for Cowboy.")
    (home-page "https://hexdocs.pm/cowboy_telemetry/")
    (license license:asl2.0)))

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

(define-public erlang-erlang-color
  (package
    (name "erlang-erlang-color")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "erlang_color" version))
       (sha256
        (base32 "0f707vxihn3f9m3zxal38ajcihnfcwms77jcax0gbzn8i7jya5vb"))))
    (build-system rebar-build-system)
    (synopsis "ANSI colors for your Erlang")
    (description "This library implements ANSI colors for your Erlang.")
    (home-page "https://hex.pm/packages/erlang_color")
    (license license:expat)))

(define-public erlang-exometer-core
  (package
    (name "erlang-exometer-core")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "exometer_core" version))
       (sha256
        (base32 "191kjqqbvz0jjijfhkbs73lnsmlrr2yinw30pkby0fx363l378xf"))))
    (build-system rebar-build-system)
    (native-inputs
     (list erlang-meck))
    (propagated-inputs (list erlang-hut erlang-parse-trans erlang-setup))
    (synopsis "Code instrumentation and metrics collection")
    (description "This package provides @code{erlang-exometer-core}, a library
for code instrumentation and metrics collection.")
    (home-page "https://hexdocs.pm/exometer_core/")
    (license license:mpl2.0)))

(define-public erlang-hackney
  (package
    (name "erlang-hackney")
    (version "1.20.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "hackney" version))
       (sha256
        (base32 "1qrqmzcqq1g8rzwcz54rjwmfrh7ydgizw609s6kw18m2y7jr947y"))))
    (build-system rebar-build-system)
    (arguments
     ;; Tests depend on erlang-jsone which is not packaged yet.
     (list
      #:tests? #f))
    (propagated-inputs
     (list erlang-certifi
           erlang-idna
           erlang-metrics
           erlang-mimerl
           erlang-parse-trans
           erlang-ssl-verify-fun
           erlang-unicode-util-compat))
    (synopsis "Simple HTTP client")
    (description "This package provides @code{erlang-hackney}, a simple HTTP
client.")
    (home-page "https://hexdocs.pm/hackney/")
    (license license:asl2.0)))

(define-public erlang-hut
  (package
    (name "erlang-hut")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "hut" version))
       (sha256
        (base32 "00xvdqyycljks3dh79jz4rjmdwcp7ky6158dywva765fkd5p1y3s"))))
    (build-system rebar-build-system)
    (synopsis
     "Helper logging library for Erlang")
    (description
     "This package provides an helper library for making Erlang libraries
logging framework agnostic.")
    (home-page "https://hex.pm/packages/hut")
    (license license:expat)))

(define-public erlang-meck
  (package
    (name "erlang-meck")
    (version "0.9.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "meck" version))
       (sha256
        (base32 "09jq0jrsd3dwzjlnwqjv6m9r2rijgiv57yja6jl41p2p2db4yd41"))))
    (build-system rebar-build-system)
    (arguments
     (list
      ;; Tests depend on elixir-unite which is not
      ;; yet packaged.
      #:tests? #f))
    (synopsis "Mocking framework for Erlang")
    (description "This package provides a mocking framework for Erlang.")
    (home-page "https://hexdocs.pm/meck/")
    (license license:asl2.0)))

(define-public erlang-metrics
  (package
    (name "erlang-metrics")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "metrics" version))
       (sha256
        (base32 "0jviygsq88x6hymrhrg1zwg1wp71ccmpk6my2xyykgf3r0w1j1mf"))))
    (build-system rebar-build-system)
    (native-inputs
     (list erlang-exometer-core))
    (synopsis "Generic interface to metrics systems in Erlang")
    (description
     "This package provides a generic interface to different metrics systems in
Erlang.")
    (home-page "https://hex.pm/packages/metrics")
    (license license:bsd-2)))

(define-public erlang-mimerl
  (package
    (name "erlang-mimerl")
    (version "1.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mimerl" version))
       (sha256
        (base32 "17gy764b7288clkx4p4a4my3z19j7rwv1fghjpg1fwl8s585mqd1"))))
    (build-system rebar-build-system)
    (synopsis "Library to handle mimetypes")
    (description "This package provides a library to handle mimetypes.")
    (home-page "https://hex.pm/packages/mimerl")
    (license license:expat)))

(define-public erlang-mochiweb
  (package
    (name "erlang-mochiweb")
    (version "3.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mochiweb" version))
       (sha256
        (base32 "1ma1p868xdgsl5jqn3hhi7cixkklw57jk49d4jrp1hj43cgya521"))))
    (build-system rebar-build-system)
    (arguments
     (list #:tests? #f))
    (synopsis "MochiMedia Web Server")
    (description "@code{MochiMedia} Web Server.")
    (home-page "https://hexdocs.pm/mochiweb/")
    (license license:expat)))

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

(define-public erlang-setup
  (package
    (name "erlang-setup")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "setup" version))
       (sha256
        (base32 "1znjcm0dpcyhd3vjm7azqngrqf49a01f41f6hm8dsw94mc6aylhx"))))
    (build-system rebar-build-system)
    (synopsis "Generic setup application for Erlang-based systems")
    (description "This package implements a generic setup application for
Erlang-based systems.")
    (home-page "https://hexdocs.pm/setup/")
    (license license:asl2.0)))

(define-public erlang-shards
  (package
    (name "erlang-shards")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "shards" version))
       (sha256
        (base32 "1nlfx82x9wpqlhyc5j22xjxdpl1kyhdx71mzbyhwss36mrfh96hn"))))
    (build-system rebar-build-system)
    (arguments
     (list
      #:tests? #f))
    (synopsis "Erlang/Elixir library for partitioned or sharded ETS tables")
    (description
     "Erlang/Elixir library for partitioned or sharded ETS tables.")
    (home-page "https://hexdocs.pm/shards/")
    (license license:expat)))

(define-public erlang-tdiff
  (package
    (name "erlang-tdiff")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "tdiff" version))
       (sha256
        (base32 "0xbq7p9ii2kp49ms1kylj92ih2jiwvqwimb8jy4aalljz5lf3hp0"))))
    (build-system rebar-build-system)
    (synopsis "Difference library")
    (description "This package provides a difference library.")
    (home-page "https://hex.pm/packages/tdiff")
    (license license:lgpl2.0)))

(define-public erlang-telemetry-poller
  (package
    (name "erlang-telemetry-poller")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "telemetry_poller" version))
       (sha256
        (base32 "13rw226g4ll4wlk6ipm0i496javf3dqzi0j6sb6xgjw1zp5xkfcy"))))
    (build-system rebar-build-system)
    (propagated-inputs (list erlang-telemetry))
    (synopsis
     "Periodically collect measurements and dispatch them as Telemetry events")
    (description
     "This package provides a library to periodically collect measurements and
dispatch them as Telemetry events.")
    (home-page "https://hexdocs.pm/telemetry_poller/")
    (license license:asl2.0)))

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
