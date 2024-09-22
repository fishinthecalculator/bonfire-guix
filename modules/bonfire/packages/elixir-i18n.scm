;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-i18n)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (gnu packages erlang)
  #:use-module (guix download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix)
  #:use-module (bonfire packages elixir-xyz))

(define-public elixir-cldr-utils
  (package
    (name "elixir-cldr-utils")
    (version "2.28.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "cldr_utils" version))
       (sha256
        (base32 "0l95qh7gh2j239mjyrjnk08yv5b7ll1bl15kb75cv9qb2wdfn1n5"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-castore erlang-certifi elixir-decimal))
    (synopsis
     "Helpers for @code{ex_cldr}")
    (description
     "@code{Map, @code{Calendar}, @code{Digits}, @code{Decimal}, @code{HTTP},
@code{Macro}, @code{Math}, and @code{String} helpers for @code{ex_cldr}.")
    (home-page "https://hexdocs.pm/cldr_utils/")
    (license license:asl2.0)))

(define-public elixir-digital-token
  (package
    (name "elixir-digital-token")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "digital_token" version))
       (sha256
        (base32 "1rp9r5jb0db52f969jmgv5sp8k0vd98dnqwrgca0fyzsqalgbmlf"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-cldr-utils elixir-jason))
    (synopsis
     "Elixir integration for ISO 24165 Digital Tokens.")
    (description
     "Elixir integration for ISO 24165 Digital Tokens (crypto currencies) through the
DTIF registry data.")
    (home-page "https://hexdocs.pm/digital_token/")
    (license license:asl2.0)))

(define-public elixir-ex-cldr
  (package
    (name "elixir-ex-cldr")
    (version "2.40.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ex_cldr" version))
       (sha256
        (base32 "1wq6hqvgdf1zgcp944makdxqpd1ldgz6yhnra4c9k0cf5rq1162h"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-stream-data))
    (propagated-inputs
     (list elixir-cldr-utils elixir-decimal elixir-gettext elixir-jason
           elixir-nimble-parsec))
    (synopsis
     "Common Locale Data Repository (CLDR) functions for Elixir")
    (description
     "Common Locale Data Repository (CLDR) functions for Elixir to localize and format
numbers, dates, lists, messages, languages, territories and units with support
for over 700 locales for internationalized (i18n) and localized (L10N)
applications.")
    (home-page "https://hexdocs.pm/ex_cldr/")
    (license license:asl2.0)))
