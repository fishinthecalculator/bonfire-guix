;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages bonfire-extensions)
  #:use-module (guix build-system mix)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire packages bonfire-libraries)
  #:use-module (bonfire packages elixir-databases)
  #:use-module (bonfire packages elixir-i18n)
  #:use-module (bonfire packages elixir-markup)
  #:use-module (bonfire packages elixir-web)
  #:use-module (bonfire packages elixir-xyz))

(define-public bonfire-common.git
  (let ((version "0.4.0")
        (revision "1")
        (commit "ea9160f5b0ce5ac535b2bad32305257a1de8da6f"))
    (package
      (name "bonfire-common")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_common.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1bnvvi3kxazkajrbkklgghjiww26shddg5ccxsp628620cx0racm"))))
      (build-system mix-build-system)
    (arguments
     (list
      ;; Tests need a live Postgres instance.
      #:tests? #f))
      (native-inputs (list elixir-assert-value
                           elixir-faker
                           elixir-mess.git))
      (propagated-inputs
       (list bonfire-data-identity.git
             bonfire-paginator.git
             elixir-arrows
             elixir-beam-file
             elixir-decorator
             elixir-ecto-shorts
             elixir-ecto-sparkles
             elixir-ecto-sql
             elixir-emote
             elixir-ex-cldr
             elixir-ex-cldr-dates-times
             elixir-ex-cldr-locale-display
             elixir-ex-cldr-numbers
             elixir-ex-cldr-plugs
             elixir-ex-cldr-units
             elixir-exkismet
             elixir-floki
             elixir-gettext
             elixir-git-diff
             elixir-html-sanitize-ex
             elixir-igniter
             elixir-json-serde
             elixir-nebulex
             elixir-needle-uid.git
             elixir-needle-ulid.git
             elixir-opentelemetry-api
             elixir-pathex
             elixir-process-tree
             elixir-recase
             elixir-sizeable
             elixir-timex
             elixir-untangle
             elixir-zest))
      (synopsis
       "Common Bonfire extension utils")
      (description
       "A library of common utils and helpers used across Bonfire extensions.

An extension for Bonfire that contains:

@itemize
@item Many common functions in {Bonfire.Common.Utils}
@item Path and URL generators in @code{Bonfire.Common.URIs}
@item Date and time helpers in @code{Bonfire.Common.DatesTimes}
@end itemize")
      (home-page "https://github.com/bonfire-networks/bonfire_common")
      (license license:mpl2.0))))
