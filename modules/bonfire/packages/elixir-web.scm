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

(define-public elixir-hpack
  (package
    (name "elixir-hpack")
    (version "3.0.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "hpack" version))
       (sha256
        (base32 "1gh4p21mlnnbprh7fxk03i53lmbdqsgi0my3r9sv9ivl9i6nm0rq"))))
    (build-system mix-build-system)
    (synopsis
     "Implementation of the
@uref{https://http2.github.io/http2-spec/compression.html,HPack} protocol")
    (description
     "This package provides @code{elixir-hpack}, an implementation of the
@uref{https://http2.github.io/http2-spec/compression.html,HPack} protocol: a
compression format for efficiently representing HTTP header fields, to be used
in HTTP/2.")
    (home-page "https://hexdocs.pm/hpack/")
    (license license:expat)))

(define-public elixir-phoenix-html
  (package
    (name "elixir-phoenix-html")
    (version "4.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_html" version))
       (sha256
        (base32 "0vvcakf4l4flzq8053srq0p96vdqsbbpyj911d8jz6mwf9ddzwpj"))))
    (build-system mix-build-system)
    (synopsis "Phoenix view functions for working with HTML templates")
    (description "This package provides @code{elixir-phoenix-html}, a library
implementing view functions for working with HTML templates in the Phoenix
framework.")
    (home-page "https://hexdocs.pm/phoenix_html/")
    (license license:expat)))

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

(define-public elixir-phoenix-template
  (package
    (name "elixir-phoenix-template")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_template" version))
       (sha256
        (base32 "01j28jf0q1h5pk9ndf7s6jx9m489jyf24byabjpkyxf6wpq8231c"))))
    (build-system mix-build-system)
    (native-inputs (list elixir-jason))
    (inputs (list elixir-phoenix-html))
    (synopsis "Template rendering for Phoenix")
    (description "Template rendering for Phoenix.")
    (home-page "https://hexdocs.pm/phoenix_template/")
    (license license:expat)))

(define-public elixir-phoenix-view
  (package
    (name "elixir-phoenix-view")
    (version "2.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_view" version))
       (sha256
        (base32 "02v2xd1h415kbf1ncclqx6acrbslh6i2gnrmfgjizwqlrqi216af"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-jason))
    (inputs (list elixir-phoenix-html elixir-phoenix-template))
    (synopsis "View layer in Phoenix v1.0-v1.6 apps")
    (description "Within LiveView and HTML apps, @code{Phoenix.View} has fallen
out of fashion in favor of @code{Phoenix.Component}.  See the \"Replaced by
@code{Phoenix.Component}\" section in the @code{Phoenix.View} module
documentation for more information and migration steps.

If you want to render other formats, such as XML, @code{Phoenix.View} may still
be a useful addition to your projects.")
    (home-page "https://hexdocs.pm/phoenix_view/")
    (license license:expat)))
