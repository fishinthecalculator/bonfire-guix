;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-markup)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix))

(define-public elixir-earmark-ast-dsl
  (package
    (name "elixir-earmark-ast-dsl")
    (version "0.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "earmark_ast_dsl" version))
       (sha256
        (base32 "1c90204jcz1pbxxdxmvwr32y663jwvpn05izqp7zmqlp8yknzlhj"))))
    (build-system mix-build-system)
    (synopsis
     "Toolset to generate EarmarkParser AST Nodes")
    (description
     "@code{EarmarkAstDsl} is a toolset to generate @code{EarmarkParser}
conformant AST Nodes.  Its main purpose is to remove boilerplate code from
Earmark and @code{EarmarkParser} tests.")
    (home-page "https://hexdocs.pm/earmark_ast_dsl/")
    (license license:asl2.0)))

(define-public elixir-floki
  (package
    (name "elixir-floki")
    (version "0.36.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "floki" version))
       (sha256
        (base32 "106mivn6ihpmcz57ksdqsb2q9nifk1hrjkvcndf4w1rgr45nqxm8"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-credo elixir-jason))
    (synopsis
     "Simple HTML parser")
    (description
     "Floki is a simple HTML parser that enables search for nodes using CSS selectors.")
    (home-page "https://hexdocs.pm/floki/")
    (license license:expat)))
