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
