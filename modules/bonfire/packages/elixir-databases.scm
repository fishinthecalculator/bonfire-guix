;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-databases)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix build-system mix)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire packages erlang-xyz)
  #:use-module (bonfire packages elixir-xyz))

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

(define-public elixir-ecto-dev-logger
  (package
    (name "elixir-ecto-dev-logger")
    (version "0.13.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ecto_dev_logger" version))
       (sha256
        (base32 "13vml7nj7vxis6gfdr6p5gd4nrdiji1ya2wv6xzn51g9vm2jpv0p"))))
    (build-system mix-build-system)
    (native-inputs (list elixir-ecto-sql))
    (propagated-inputs (list elixir-ecto elixir-geo elixir-jason))
    (synopsis "Alternative Ecto logger for development")
    (description "This package provides an alternative Ecto logger for
development.")
    (home-page "https://hexdocs.pm/ecto_dev_logger/")
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
    (propagated-inputs
     (list elixir-db-connection
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

(define-public elixir-ex-machina
  (package
    (name "elixir-ex-machina")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ex_machina" version))
       (sha256
        (base32 "0abpg9i08w0iglc0qcl5b3g91jw22s3mvyn4nvxc3hf0cjf1mzkr"))))
    (build-system mix-build-system)
    (native-inputs (list elixir-excoveralls))
    (propagated-inputs (list elixir-ecto elixir-ecto-sql))
    (synopsis
     "Factory library")
    (description
     "This package provides a factory library by the creators of @code{FactoryBot}
(@code{FactoryGirl}).")
    (home-page "https://hexdocs.pm/ex_machina/")
    (license license:expat)))

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

(define-public elixir-needle-ulid
  (package
    (name "elixir-needle-ulid")
    (version "0.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "needle_ulid" version))
       (sha256
        (base32 "14ryrgsabj08v1a0wyad21aizyy8kcr0n1l1z6ks6fvv4v2hskfm"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-ecto elixir-ecto-sql elixir-ex-ulid))
    (synopsis
     "Provides an ULID datatype for @code{Ecto} and related helpers")
    (description
     "This package provides @code{elixir-needle-ulid}, a library implementing an
ULID datatype for @code{Ecto} (using @code{ex_ulid}) and related helpers.")
    (home-page "https://hexdocs.pm/needle_ulid/")
    (license license:expat)))

(define-public elixir-needle
  (package
    (name "elixir-needle")
    (version "0.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "needle" version))
       (sha256
        (base32 "0gf1bniwf650xrczvimmw1drg6cjqz21539nlhqw4la4m91jl7h4"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-ecto-sql elixir-exto elixir-needle-ulid
                             erlang-telemetry))
    (synopsis
     "Universal foreign keys, virtual schemas, and shared data mixins")
    (description
     "When using a relational DB (such an @code{Ecto} schema with a Postgres
table), usually a foreign key field has to be pre-defined with a reference
pointing to a specific field in a specific table.

Besides regular schemas with universal foreign keys (@code{Pointable}),
@code{Needle} provides @code{Virtual} for schemas that don’t have any fields on
their own, and @code{Mixin} for storing common fields that can be re-used by
multiple @code{Pointable}s or @code{Virtual}s.")
    (home-page "https://hexdocs.pm/needle/")
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

(define-public elixir-uniq
  (package
    (name "elixir-uniq")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "uniq" version))
       (sha256
        (base32 "05mrzx7g8q5c4jg38pxqcw1x3bysw0i5n4j7d42v6m3hcx6w69k4"))))
    (build-system mix-build-system)
    (native-inputs (list elixir-stream-data))
    (propagated-inputs (list elixir-ecto))
    (synopsis
     "Provides UUID generation, parsing, and formatting")
    (description
     "This package provides UUID generation, parsing, and formatting.  Supports RFC
4122, and the v6 draft extension.")
    (home-page "https://hexdocs.pm/uniq/")
    (license license:asl2.0)))

(define-public elixir-uuidv7
  (package
    (name "elixir-uuidv7")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "uuidv7" version))
       (sha256
        (base32 "1g2c8imkk7pgcvc5ns2v1b0zils3ai1yym4s3a5psvs511qk7k8f"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-ecto))
    (synopsis "UUID v7 implementation and @code{Ecto.Type} for Elixir")
    (description
     "This package provides a UUID v7 implementation and @code{Ecto.Type}
for Elixir.")
    (home-page "https://hexdocs.pm/uuidv7/")
    (license license:expat)))
