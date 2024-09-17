;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-xyz)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix)
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

(define-public elixir-decorator
  (package
    (name "elixir-decorator")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "decorator" version))
       (sha256
        (base32 "0zsrasbf6z3g7xs1s8gk5g7rf49ng1dskphqfif8gnl3j3fww1qa"))))
    (build-system mix-build-system)
    (synopsis "Function decorators for Elixir")
    (description "This package provides @code{elixir-decorator}, a library
implementing function decorators for Elixir.")
    (home-page "https://hexdocs.pm/decorator/")
    (license license:expat)))

(define-public elixir-ex-ulid
  (package
    (name "elixir-ex-ulid")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ex_ulid" version))
       (sha256
        (base32 "0q08y8xw2q4dr1w6g3rcyjlgib2w2wz26znycfan7i7bg93zvgm2"))))
    (build-system mix-build-system)
    (synopsis
     "Universally Unique Lexicographically Sortable Identifier (ULID) in Elixir")
    (description
     "This package provides @code{elixir-ex-ulid} an implementation of
Universally Unique Lexicographically Sortable Identifier (ULID).")
    (home-page "https://hexdocs.pm/ex_ulid/")
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
    (propagated-inputs (list elixir-jason))
    (synopsis "Encodes and decodes WKB, WKT, and GeoJSON formats")
    (description "This package provides @code{elixir-geo}, a library to encode
and decode WKB, WKT, and @code{GeoJSON} formats.")
    (home-page "https://hexdocs.pm/geo/")
    (license license:expat)))

(define-public elixir-mime
  (package
    (name "elixir-mime")
    (version "2.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mime" version))
       (sha256
        (base32 "0ghmkcyx3lcgzrjasf51k42d628fiqzn9hxai5rp8vdjlrim7569"))))
    (build-system mix-build-system)
    (synopsis "MIME type module")
    (description "This package provides @code{elixir-mime}, a MIME type module
for Elixir.")
    (home-page "https://hexdocs.pm/mime/")
    (license license:asl2.0)))

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
