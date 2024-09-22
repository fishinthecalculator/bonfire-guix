;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-markup)
  #:use-module (gnu packages elixir-xyz)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix)
  #:use-module (bonfire packages elixir-xyz))

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

(define-public elixir-earmark-parser
  (package
    (name "elixir-earmark-parser")
    (version "1.4.41")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "earmark_parser" version))
       (sha256
        (base32 "1ymy7s3fvf9vapf4sr62cmik3asp5rd1na9fg711frjbwg3h86m8"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-earmark-ast-dsl elixir-excoveralls elixir-floki))
    (synopsis "AST parser and generator for Markdown")
    (description "This package providesAST parser and generator for Markdown.")
    (home-page "https://hexdocs.pm/earmark_parser/")
    (license license:asl2.0)))

(define-public elixir-earmark
  (package
    (name "elixir-earmark")
    (version "1.4.47")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "earmark" version))
       (sha256
        (base32 "1y4qqq3bxim9b9jrpbdxpagsjs5whlig4zva6hxmznf2lazbx5iy"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-earmark-ast-dsl
           elixir-excoveralls
           elixir-floki
           elixir-traverse))
    (synopsis
     "Elixir Markdown converter")
    (description
     "Earmark is a pure-Elixir Markdown converter.  It is intended to be used as a
library (just call Earmark.as_html), but can also be used as a command-line tool
(run mix escript.build first).  Output generation is pluggable.")
    (home-page "https://hexdocs.pm/earmark/")
    (license license:asl2.0)))

(define-public elixir-easyhtml
  (package
    (name "elixir-easyhtml")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "easyhtml" version))
       (sha256
        (base32 "01jxhj3hpivf5c0x7d11c8xrx3d0ln6wsa78lc58g90j2vwkdadn"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-floki))
    (synopsis "Tiny wrapper around Floki")
    (description "@code{EasyHTML} makes working with HTML easy.  It is a tiny
wrapper around Floki that adds conveniences:

@itemize
@item An @code{Inspect} implementation to pretty-print HTML snippets
@item An @code{Access} implementation to search them
@item An @code{Enumerable} implementation to traverse them
item A @code{String.Chars} implementation to convert them to text
")
    (home-page "https://hexdocs.pm/easyhtml/")
    (license license:asl2.0)))

(define-public elixir-ex-doc
  (package
    (name "elixir-ex-doc")
    (version "0.34.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ex_doc" version))
       (sha256
        (base32 "1hcmbycrvd441cmbh5apsv7llkyk5rmdxlzyd88512i085mz3raw"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-easyhtml
           elixir-jason
           elixir-floki))
    (propagated-inputs (list elixir-earmark-parser elixir-makeup-c elixir-makeup-elixir
                  elixir-makeup-erlang elixir-makeup-html))
    (synopsis "Documentation generation tool for Elixir")
    (description "@code{ExDoc} is a documentation generation tool for Elixir.")
    (home-page "https://hexdocs.pm/ex_doc/")
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

(define-public elixir-makeup-c
  (package
    (name "elixir-makeup-c")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "makeup_c" version))
       (sha256
        (base32 "0s98gwsvi88mxf3wjsi05l7dgkw4gzbihzlsq5ad68i86x2wzsc9"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-makeup))
    (synopsis "C lexer for the Makeup syntax highlighter")
    (description "This package provides @code{elixir-makeup-c}, a library
implementing a C lexer for the Makeup syntax highlighter.")
    (home-page "https://hexdocs.pm/makeup_c/")
    (license license:bsd-2)))

(define-public elixir-makeup-elixir
  (package
    (name "elixir-makeup-elixir")
    (version "0.16.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "makeup_elixir" version))
       (sha256
        (base32 "0svh86rqn89wpn23favmqy22krh996w5h9ycwsxzcqs7f1w3j6a1"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-makeup elixir-nimble-parsec))
    (synopsis "Elixir lexer for the Makeup syntax highlighter")
    (description "This package provides @code{elixir-makeup-elixir}, a library
implementing an Elixir lexer for the Makeup syntax highlighter.")
    (home-page "https://hexdocs.pm/makeup_elixir/")
    (license license:bsd-2)))

(define-public elixir-makeup-erlang
  (package
    (name "elixir-makeup-erlang")
    (version "1.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "makeup_erlang" version))
       (sha256
        (base32 "053qyls338qznyqi9x8s9l0mxdvh91p6lj8mxbb9imy2rkpa32ca"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-makeup))
    (synopsis "Erlang lexer for the Makeup syntax highlighter")
    (description "This package provides @code{elixir-makeup-erlang}, a library
implementing an Erlang lexer for the Makeup syntax highlighter.")
    (home-page "https://hexdocs.pm/makeup_erlang/")
    (license license:bsd-2)))

(define-public elixir-makeup-html
  (package
    (name "elixir-makeup-html")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "makeup_html" version))
       (sha256
        (base32 "19165idrm3qncvh63f3n7hpx4g3r536adsmggzfladi4qldsdwj4"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-stream-data))
    (propagated-inputs (list elixir-makeup))
    (synopsis "HTML lexer for the Makeup syntax highlighter")
    (description "This package provides @code{elixir-makeup-html}, a library
implementing an HTML lexer for the Makeup syntax highlighter.")
    (home-page "https://hexdocs.pm/makeup_html/")
    (license license:expat)))
