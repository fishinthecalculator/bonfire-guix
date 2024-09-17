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

(define-public elixir-db-connection
  (package
    (name "elixir-db-connection")
    (version "2.7.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "db_connection" version))
       (sha256
        (base32 "1zykppj97pc1x0apy8ag40r1mmi3hbbvlzvqziyqa7vhn8qqzw6w"))))
    (build-system mix-build-system)
    (arguments
     (list
      ;; Tests require a db process
      #:tests? #f
      #:build-per-environment #f))
    (propagated-inputs (list erlang-telemetry))
    (synopsis
     "Database connection behaviour")
    (description
     "This package provides @code{elixir-db-connection}, a library implementing
database connection behaviour and database connection pool.  It is designed for
handling transaction, prepare/execute, cursors and client process
describe/encode/decode.")
    (home-page "https://hexdocs.pm/db_connection/")
    (license license:asl2.0)))

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
    (propagated-inputs (list elixir-decimal elixir-jason erlang-telemetry))
    (synopsis
     "Toolkit for data mapping and language integrated query for Elixir")
    (description
     "This package provides a toolkit for data mapping and language integrated query
for Elixir.")
    (home-page "https://hexdocs.pm/ecto/")
    (license license:asl2.0)))

(define-public elixir-ecto-sql
  (package
    (name "elixir-ecto-sql")
    (version "3.12.0")
(source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/elixir-ecto/ecto_sql.git")
               (commit (string-append "v" version))))
         (file-name (git-file-name name version))
         (sha256
          (base32 "15k7rmf8i6qx25hcqk88j8d6ydd0mf5jalrdyrnlia6ybw99dk7n"))))
    (build-system mix-build-system)
    (inputs (list elixir-db-connection
                  elixir-ecto
                  elixir-myxql
                  elixir-postgrex
                  elixir-tds))
    (synopsis "SQL-based adapters for Ecto and database migrations")
    (description "@code{Ecto SQL} provides building blocks for writing SQL
adapters for Ecto.  It features:

@itemize
@item The @code{Ecto.Adapters.SQL} module as an entry point for all SQL-based
adapters
@item Default implementations for Postgres (@code{Ecto.Adapters.Postgres}),
MySQL (@code{Ecto.Adapters.MyXQL}), and MSSQL (@code{Ecto.Adapters.Tds})
@item A test sandbox (@code{Ecto.Adapters.SQL.Sandbox}) that concurrently runs
database tests inside transactions
@item Support for database migrations via Mix tasks
@ent itemize")
    (home-page "https://hexdocs.pm/ecto_sql/")
    (license license:asl2.0)))

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
    (propagated-inputs (list elixir-accessible elixir-ecto))
    (native-inputs
     (list elixir-decimal))
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
    (propagated-inputs (list elixir-jason))
    (synopsis "Encodes and decodes WKB, WKT, and GeoJSON formats")
    (description "This package provides @code{elixir-geo}, a library to encode
and decode WKB, WKT, and @code{GeoJSON} formats.")
    (home-page "https://hexdocs.pm/geo/")
    (license license:expat)))

(define-public elixir-myxql
  (package
    (name "elixir-myxql")
    (version "0.7.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "myxql" version))
       (sha256
        (base32 "0dj9034nfyii8dmd7c1hdkvikgkfh5rd9hhahnshjfimagzwv4d4"))))
    (build-system mix-build-system)
    (native-inputs
     (list erlang-binpp))
    (propagated-inputs (list elixir-db-connection elixir-decimal elixir-geo elixir-jason
                  elixir-table))
    (synopsis "MySQL 5.5+ driver for Elixir")
    (description "This library provides a @code{MySQL} 5.5+ driver for Elixir.")
    (home-page "https://hexdocs.pm/myxql/")
    (license license:asl2.0)))

(define-public elixir-postgrex
  (package
    (name "elixir-postgrex")
    (version "0.19.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "postgrex" version))
       (sha256
        (base32 "1y58v3jsya98462r43mv29wwgf3vv8dz9jn63q4iwf4gl62pib4b"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-db-connection elixir-decimal elixir-jason
                  elixir-table))
    (synopsis "PostgreSQL driver for Elixir")
    (description "This library provides a @code{PostgreSQL} driver for Elixir.")
    (home-page "https://hexdocs.pm/postgrex/")
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

(define-public elixir-tds
  (package
    (name "elixir-tds")
    (version "2.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "tds" version))
       (sha256
        (base32 "1wk20rk1fjh16swlkiyl3fs91lj4w4dk77l5z77vp12mvpsm1qsj"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-db-connection elixir-decimal elixir-jason
           elixir-table))
    (synopsis
     "Elixir implementation of the MS TDS protocol")
    (description
     "This package implements a Microsoft SQL Server client.  More generally it
provides an Elixir implementation of the MS TDS protocol.")
    (home-page "https://hexdocs.pm/tds/")
    (license license:asl2.0)))
