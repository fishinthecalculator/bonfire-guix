;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-xyz)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix build-system mix)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire packages erlang-xyz))

(define-public elixir-accessible
  (package
    (name "elixir-accessible")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "accessible" version))
       (sha256
        (base32 "15pjj1gwc8y18di224yn5g02kxvlardld24a16wzg0mb2431p88k"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls))
    (synopsis "Dead-simple Access behaviour for custom structs")
    (description "This package-provides @code{elixir-accessible}, a library
providing @code{Access} behaviour for custom structs.")
    (home-page "https://hexdocs.pm/accessible/")
    (license license:expat)))

(define-public elixir-decimal
  (package
    (name "elixir-decimal")
    (version "2.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "decimal" version))
       (sha256
        (base32 "1k7z418b6cj977wswpxsk5844xrxc1smaiqsmrqpf3pdjzsfbksk"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-stream-data))
    (synopsis "Arbitrary precision decimal arithmetic")
    (description "This package provides @code{elixir-decimal}, a library that
represents values internally using three integers: a sign, a coefficient, and an
exponent.  In this way, numbers of any size and with any number of decimal
places can be represented exactly.")
    (home-page "https://hexdocs.pm/decimal/")
    (license license:asl2.0)))

(define-public elixir-ecto
  (package
    (name "elixir-ecto")
    (version "3.12.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ecto" version))
       (sha256
        (base32 "0rcisp34m8b058jrcf52nziyscmn1h6yfjfw91ggj8p7d9893zcy"))))
    (build-system mix-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'build 'set-erl-libs
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((telemetry #$(this-package-input "erlang-telemetry")))
                (setenv "ERL_LIBS" (string-append telemetry "/lib/erlang/lib"))))))))
    (inputs (list elixir-decimal elixir-jason erlang-telemetry))
    (synopsis
     "Toolkit for data mapping and language integrated query for Elixir")
    (description
     "This package provides a toolkit for data mapping and language integrated query
for Elixir.")
    (home-page "https://hexdocs.pm/ecto/")
    (license license:asl2.0)))

(define-public elixir-exto
  (package
    (name "elixir-exto")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "exto" version))
       (sha256
        (base32 "1mkzxj37dqb966fhqg528wrlfx9ifgxis87np4fqc30rqabgsyj4"))))
    (build-system mix-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'set-erl-libs
            (lambda _
             (let ((telemetry #$(this-package-native-input "erlang-telemetry")))
                (setenv "ERL_LIBS" (string-append telemetry "/lib/erlang/lib"))))))))
    (inputs (list elixir-accessible elixir-ecto))
    (native-inputs
     (list erlang-telemetry
           elixir-decimal))
    (synopsis "Extend ecto schema definitions in config")
    (description "@code{Exto} is an Elixir library providing
configuration-driven @code{Ecto} schema extensibility.")
    (home-page "https://hexdocs.pm/exto/")
    (license license:asl2.0)))

(define-public elixir-geo
  (package
    (name "elixir-geo")
    (version "3.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "geo" version))
       (sha256
        (base32 "1nk8c4099bmhfgspagx9ikd6m9x965js7mwa7jy58fqq2zvfpg8x"))))
    (build-system mix-build-system)
    (inputs (list elixir-jason))
    (synopsis "Encodes and decodes WKB, WKT, and GeoJSON formats")
    (description "This package provides @code{elixir-geo}, a library to encode
and decode WKB, WKT, and @code{GeoJSON} formats.")
    (home-page "https://hexdocs.pm/geo/")
    (license license:expat)))

(define-public elixir-stream-data
  (package
    (name "elixir-stream-data")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "stream_data" version))
       (sha256
        (base32 "134c7dyvprvnfm7fz6dvhk1mifrd0iq2pwjkzmiq8wq6pm3cvl25"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls))
    (synopsis "Data generation and property-based testing for Elixir")
    (description "@code{StreamData} is an Elixir library for data generation and
property-based testing.")
    (home-page "https://hexdocs.pm/stream_data/")
    (license license:asl2.0)))

(define-public elixir-table
  (package
    (name "elixir-table")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "table" version))
       (sha256
        (base32 "0aah0rkq6ikl1w359n65rmhk0p0npwj0fr35grf321pqzrzbr6by"))))
    (build-system mix-build-system)
    (synopsis "Unified access to tabular data")
    (description "This package provides @code{elixir-table}, a library that
implements unified access to tabular data.")
    (home-page "https://hexdocs.pm/table/")
    (license license:asl2.0)))
