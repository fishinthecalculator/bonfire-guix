;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-web)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix)
  #:use-module (bonfire packages elixir-xyz))

(define-public elixir-phoenix-pubsub
  (package
    (name "elixir-phoenix-pubsub")
    (version "2.1.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_pubsub" version))
       (sha256
        (base32 "00p5dvizhawhqbia2cakdn4whaxsm2adq3lzfn3b137xvk0np85v"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests require network
     (list #:tests? #f))
    (synopsis "Distributed PubSub and Presence platform")
    (description "This package provides @code{elixir-phoenix-pubsub}, a library
implementing a distributed @code{PubSub} and @code{Presence} platform for the
Phoenix Framework.")
    (home-page "https://hexdocs.pm/phoenix_pubsub/")
    (license license:expat)))
