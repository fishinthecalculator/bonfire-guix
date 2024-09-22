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
  #:use-module (bonfire packages erlang-xyz)
  #:use-module (bonfire packages elixir-databases)
  #:use-module (bonfire packages elixir-i18n)
  #:use-module (bonfire packages elixir-markup)
  #:use-module (bonfire packages elixir-xyz))

(define-public elixir-bandit
  (package
    (name "elixir-bandit")
    (version "1.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "bandit" version))
       (sha256
        (base32 "1kbi2fjbnynqdm7lvd2w81nblv3v2pdm45mam4pymjyjhyp95pgj"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on elixir-req which is not yet packaged.
     (list #:tests? #f))
    (propagated-inputs
     (list elixir-hpax
           elixir-plug
           erlang-telemetry
           elixir-thousand-island
           elixir-websock))
    (synopsis "HTTP server built for Plug & WebSock apps")
    (description
     "This package provides a pure-Elixir HTTP server built for Plug & @code{WebSock}
apps.")
    (home-page "https://hexdocs.pm/bandit/")
    (license license:expat)))

(define-public elixir-ex-cldr-plugs
  (package
    (name "elixir-ex-cldr-plugs")
    (version "1.3.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ex_cldr_plugs" version))
       (sha256
        (base32 "1azambs6sqyapgfbazvn4lsa5jcr03qdsrf82lavg4crga6zmsr3"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-ex-cldr elixir-gettext elixir-jason elixir-plug))
    (synopsis
     "Plugs supporting CLDR")
    (description
     "Plugs supporting CLDR and setting the locale from requests and request headers.")
    (home-page "https://hexdocs.pm/ex_cldr_plugs/")
    (license license:asl2.0)))

(define-public elixir-emote
  (package
    (name "elixir-emote")
    (version "0.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "emote" version))
       (sha256
        (base32 "1km0hkvjpswxrvadrz4wjarpnv6wz3p15bdmmlw0yswnfvmij4ni"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-phoenix-html))
    (synopsis
     "Convert emoticons and emoji names to emoji characters or images")
    (description
     "This package provides @code{elixir-emote}, a small library for
converting emoticons and emoji names to emoji characters or images,
including custom emoji.")
    (home-page "https://hexdocs.pm/emote/")
    (license license:wtfpl2)))

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

(define-public elixir-hpax
  (package
    (name "elixir-hpax")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "hpax" version))
       (sha256
        (base32 "00fnzb8cc2xvjmai1cvh4mac4gsrjq93dzf7znjjq7ki3mri84vz"))))
    (build-system mix-build-system)
    (native-inputs
     (list erlang-coveralls
           elixir-excoveralls
           elixir-castore
           elixir-hpack
           elixir-stream-data))
    (synopsis "Implementation of the HPACK protocol (RFC 7541) for Elixir")
    (description "This package provides @code{elixir-hpax}, an implementation of
the HPACK protocol (RFC 7541) for Elixir.")
    (home-page "https://hexdocs.pm/hpax/")
    (license license:asl2.0)))

(define-public elixir-html-entities
  (package
    (name "elixir-html-entities")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "html_entities" version))
       (sha256
        (base32 "1k7xyj0q38ms3n5hbn782pa6w1vgd6biwlxr4db6319l828a6fy5"))))
    (build-system mix-build-system)
    (synopsis "Decode and encode HTML entities in a string")
    (description "This library provides an Elixir module to decode and encode
HTML entities in a string.")
    (home-page "https://hexdocs.pm/html_entities/")
    (license license:expat)))

(define-public elixir-html-sanitize-ex
  (package
    (name "elixir-html-sanitize-ex")
    (version "1.4.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "html_sanitize_ex" version))
       (sha256
        (base32 "1dyc9fvkdrihmy32d85jqlzs9jrbijahq5dpdry9r57y98y8sx47"))))
    (build-system mix-build-system)
    (propagated-inputs (list erlang-mochiweb))
    (synopsis "HTML sanitizer for Elixir")
    (description "HTML sanitizer for Elixir.")
    (home-page "https://hexdocs.pm/html_sanitize_ex/")
    (license license:expat)))

(define-public elixir-httpoison
  (package
    (name "elixir-httpoison")
    (version "2.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "httpoison" version))
       (sha256
        (base32 "1pyjqbm6y88yws3956izxc1wvjhrjzizidg49zhq17a25xnlwdji"))))
    (build-system mix-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list erlang-hackney))
    (synopsis "Yet Another HTTP client for Elixir")
    (description "Yet Another HTTP client for Elixir powered by hackney.")
    (home-page "https://hexdocs.pm/httpoison/")
    (license license:expat)))

(define-public elixir-iconify-ex
  (package
    (name "elixir-iconify-ex")
    (version "0.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "iconify_ex" version))
       (sha256
        (base32 "1adilrzzg9gw5m353gwc4add3a4nf6wk562jdf0rz5p33hf782my"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-arrows
           elixir-emote
           elixir-floki
           elixir-jason
           elixir-phoenix-live-favicon
           elixir-phoenix-live-view
           elixir-recase
           elixir-surface
           elixir-untangle))
    (synopsis
     "Phoenix helpers for using icon sets")
    (description
     "This package provides Phoenix helpers for using the 100,000+ SVG icons
from 100+ icon sets from @uref{https://iconify.design, iconify.design}.")
    (home-page "https://hexdocs.pm/iconify_ex/")
    (license license:expat)))

(define-public elixir-mint-web-socket
  (package
    (name "elixir-mint-web-socket")
    (version "1.0.4")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mint_web_socket" version))
       (sha256
        (base32 "14d9c2ryqggl2p54bh0rhm3ab17j6l7ir817rsh4nnn455alqz82"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on gun from hex.pm which is not packaged yet.
     (list #:tests? #f))
    (native-inputs (list elixir-jason erlang-cowboy))
    (propagated-inputs (list elixir-mint))
    (synopsis "WebSocket support for Mint")
    (description "HTTP/1 and HTTP/2 @code{WebSocket} support for Mint.")
    (home-page "https://hexdocs.pm/mint_web_socket/")
    (license license:asl2.0)))

(define-public elixir-mint
  (package
    (name "elixir-mint")
    (version "1.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mint" version))
       (sha256
        (base32 "1yb37pm90kafja6jg53pb2kgv0pxx2pp8zqjb6pg34hqzkgl3r2y"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on elixir-mox which is not packaged yet.
     (list #:tests? #f))
    (native-inputs
     (list elixir-excoveralls))
    (propagated-inputs (list elixir-castore elixir-hpax))
    (synopsis "Functional HTTP client for Elixir with support for HTTP/1 and
HTTP/2")
    (description "Mint is different from most Erlang and Elixir HTTP clients
because it provides a process-less architecture.  Instead, Mint is based on a
functional and immutable data structure that represents an HTTP connection.

This data structure wraps a TCP or SSL socket.  This allows for more
fine-tailored architectures where the developer is responsible for wrapping the
connection struct, such as having one process handle multiple connections or
having different kinds of processes handle connections.")
    (home-page "https://hexdocs.pm/mint/")
    (license license:asl2.0)))

(define-public elixir-phoenix-ecto
  (package
    (name "elixir-phoenix-ecto")
    (version "4.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_ecto" version))
       (sha256
        (base32 "0nfdbwxvx24468fan8cd8nc34nlnnpbmv32z1zh6ps4xyljx151z"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-ecto
           elixir-phoenix-html
           elixir-plug
           elixir-postgrex))
    (synopsis "Phoenix and Ecto integration with support for concurrent
acceptance testing")
    (description "A project that integrates Phoenix with Ecto, implementing all
relevant protocols.")
    (home-page "https://hexdocs.pm/phoenix_ecto/")
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

(define-public elixir-phoenix-html-3.3
  (package
    (inherit elixir-phoenix-html)
    (version "3.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_html" version))
       (sha256
        (base32 "1yskpy2wa0hm0arw9rji66z2bcvcg3cy6zjy87rsy51pxjmx6j82"))))))

(define-public elixir-phoenix-live-favicon
  (package
    (name "elixir-phoenix-live-favicon")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_live_favicon" version))
       (sha256
        (base32 "17m7gpx6qw0cr0d2acwajjhz2qzfi2zywzyk2i139y9higb22q8k"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on makeup_diff from hex.pm but it is not packaged yet.
     (list #:tests? #f))
    (propagated-inputs (list elixir-phoenix-live-head))
    (synopsis "Favicon manipulation for Phoenix Live Views")
    (description "This package provides a lib enabling dynamic favicons in
Phoenix Live View applications.")
    (home-page "https://hexdocs.pm/phoenix_live_favicon/")
    (license license:expat)))

(define-public elixir-phoenix-live-head
  (package
    (name "elixir-phoenix-live-head")
    (version "0.2.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_live_head" version))
       (sha256
        (base32 "06ds5mqsibdrwzxn8rn5iisfkg8gnlzrfb4dgckwrxwrak43vzpx"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls))
    (propagated-inputs
     (list elixir-ex-doc elixir-jason elixir-phoenix
           elixir-phoenix-html elixir-phoenix-live-view))
    (synopsis "HTML Head manipulation for Phoenix Live Views")
    (description "This package provides commands for manipulating the HTML Head
of Phoenix Live View applications while minimizing data over the wire.

The available command actions support a variety of utility operations useful for
HTML Head manipulation.  Such as setting or removing tag attributes and adding
or removing CSS classes.

A special feature is the use of the @code{@{dynamic@}} tag in values.  This
saves data over the wire by only sending the dynamic part of an attributes
value.")
    (home-page "https://hexdocs.pm/phoenix_live_head/")
    (license license:expat)))

(define-public elixir-phoenix-live-reload
  (package
    (name "elixir-phoenix-live-reload")
    (version "1.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_live_reload" version))
       (sha256
        (base32 "0g40aixr1qxfs6bl45kl1crk0w1ys52y14mc3jyz27xh7kbrrv5l"))))
    (build-system mix-build-system)
    (arguments
     (list #:tests? #f))
    (propagated-inputs (list elixir-file-system elixir-phoenix))
    (synopsis "Live-reload functionality for Phoenix")
    (description
     "This package provides live-reload functionality for Phoenix.")
    (home-page "https://hexdocs.pm/phoenix_live_reload/")
    (license license:expat)))

(define-public elixir-phoenix-live-view
  (package
    (name "elixir-phoenix-live-view")
    (version "0.20.17")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix_live_view" version))
       (sha256
        (base32 "12z9bkvfan8bb9dicy8s4sswxy28dbd89q0drbdmzj3qzcgp87d6"))))
    (build-system mix-build-system)
    (arguments
     (list #:tests? #f))
    (native-inputs
     (list elixir-html-entities
           elixir-phoenix-live-reload))
    (propagated-inputs
     (list elixir-floki
           elixir-jason
           elixir-phoenix
           elixir-phoenix-html
           elixir-phoenix-template
           elixir-phoenix-view
           elixir-plug
           erlang-telemetry))
    (synopsis "Rich, real-time user experiences with server-rendered HTML")
    (description "LiveView brings a unified experience to building web
applications.  You no longer have to split work between client and server,
across different toolings, layers, and abstractions.  Instead, LiveView
enriches the server with a declarative and powerful model while keeping your
code closer to your data (and ultimately your source of truth):

@itemize
@item Declarative server side rendering
@item Rich templating language
@item Diffs over the wire
@item Live form validation
@item File uploads with progress indicators
@item Optimistic updates and transitions
@item Live navigation
@item Latency simulator
@end itemize")
    (home-page "https://hexdocs.pm/phoenix_live_view/")
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
    (propagated-inputs (list elixir-phoenix-html))
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
    (propagated-inputs (list elixir-phoenix-html elixir-phoenix-template))
    (synopsis "View layer in Phoenix v1.0-v1.6 apps")
    (description "Within LiveView and HTML apps, @code{Phoenix.View} has fallen
out of fashion in favor of @code{Phoenix.Component}.  See the \"Replaced by
@code{Phoenix.Component}\" section in the @code{Phoenix.View} module
documentation for more information and migration steps.

If you want to render other formats, such as XML, @code{Phoenix.View} may still
be a useful addition to your projects.")
    (home-page "https://hexdocs.pm/phoenix_view/")
    (license license:expat)))

(define-public elixir-phoenix
  (package
    (name "elixir-phoenix")
    (version "1.7.14")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phoenix" version))
       (sha256
        (base32 "06p6mj9g6k81ks512c82afmcnn73v9shf97wxhcyzpy5dk2rp1f7"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-mint
           elixir-mint-web-socket
           elixir-phx-new))
    (propagated-inputs
     (list elixir-castore
                  elixir-jason
                  elixir-phoenix-pubsub
                  elixir-phoenix-html
                  elixir-phoenix-template
                  elixir-phoenix-view
                  elixir-plug
                  elixir-plug-cowboy
                  elixir-plug-crypto
                  erlang-telemetry
                  elixir-websock-adapter))
    (synopsis "Web development framework")
    (description "Phoenix is a web development framework written in Elixir
which implements the server-side Model View Controller (MVC) pattern.  Many of
its components and concepts will seem familiar to those with experience in other
web frameworks like Ruby on Rails or Python's Django.")
    (home-page "https://www.phoenixframework.org/")
    (license license:expat)))

(define-public elixir-phx-new
  (package
    (name "elixir-phx-new")
    (version "1.7.14")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "phx_new" version))
       (sha256
        (base32 "0faa65wv6rsfkbryizh52islq9kmy6hnrncmxfy98bcska1v7a71"))))
    (build-system mix-build-system)
    (synopsis
     "Phoenix framework project generator")
    (description
     "Phoenix framework project generator.  Provides a @command{mix phx.new}
task to bootstrap a new Elixir application with Phoenix dependencies.")
    (home-page "https://hexdocs.pm/phx_new/")
    (license license:expat)))

(define-public elixir-plug-cowboy
  (package
    (name "elixir-plug-cowboy")
    (version "2.7.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "plug_cowboy" version))
       (sha256
        (base32 "0bxv37h5m0ypz2yc42pw4fdddghcdy0yh0608140j1i3xq8qlp94"))))
    (build-system mix-build-system)
    (arguments
     (list
      #:tests? #f))
    (native-inputs
     (list elixir-x509
           erlang-hackney))
    (propagated-inputs (list erlang-cowboy erlang-cowboy-telemetry elixir-plug))
    (synopsis "A Plug adapter for Cowboy")
    (description "This package provides a Plug adapter for Cowboy.")
    (home-page "https://hexdocs.pm/plug_cowboy/")
    (license license:asl2.0)))

(define-public elixir-plug-crypto
  (package
    (name "elixir-plug-crypto")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "plug_crypto" version))
       (sha256
        (base32 "1yn44iw4688lbqwzap2wp55hxrhs8b28n0r61z7gif1hn2j1c4hk"))))
    (build-system mix-build-system)
    (synopsis "Crypto-related functionality for the web")
    (description "This package provides @code{elixir-plug-crypto}, a library
implementing crypto-related functionality for the web, used by Plug.")
    (home-page "https://hexdocs.pm/plug_crypto/")
    (license license:asl2.0)))

(define-public elixir-plug
  (package
    (name "elixir-plug")
    (version "1.16.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "plug" version))
       (sha256
        (base32 "1p6dz1bn1s5hhpnp2h6372r42f15alkmp53l73ixf0vb02wzcgx1"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-mime elixir-plug-crypto erlang-telemetry))
    (synopsis "Compose web applications with functions")
    (description "Plug is:

@itemize
@item A specification for composing web applications with functions
@item Connection adapters for different web servers in the Erlang VM
@end itemize

In other words, Plug allows you to build web applications from small pieces and
run them on different web servers.  Plug is used by web frameworks such as
Phoenix to manage requests, responses, and websockets.  This documentation will
show some high-level examples and introduce the Plug's main building blocks.")
    (home-page "https://hexdocs.pm/plug/")
    (license license:asl2.0)))

(define-public elixir-surface
  (package
    (name "elixir-surface")
    (version "0.11.5")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "surface" version))
       (sha256
        (base32 "1l7d43m4rkvv3r6w9jpl5b6cdgr5yhgjsdpwd12vs7f9j43n9318"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-ecto
           elixir-floki
           elixir-jason
           elixir-phoenix-ecto
           elixir-sourceror))
    (propagated-inputs
     (list elixir-phoenix-html-3.3
           elixir-phoenix-live-view
           elixir-sourceror))
    (synopsis "Server-side rendering component library for Phoenix")
    (description
     "This package provides Surface is a server-side rendering component library
that allows developers to build rich interactive user-interfaces, writing
minimal custom JavaScript.")
    (home-page "https://surface-ui.org")
    (license license:expat)))

(define-public elixir-websock-adapter
  (package
    (name "elixir-websock-adapter")
    (version "0.5.7")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "websock_adapter" version))
       (sha256
        (base32 "1lfv7cw9hakdv56l9wyrg6q8i20cdvyp61l09g3gxpfyckp7ix6h"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-bandit
           elixir-plug
           elixir-plug-cowboy
           elixir-websock))
    (synopsis "WebSock adapters for common web servers")
    (description
     "This package provides a set of @code{WebSock} adapters for common web servers.")
    (home-page "https://hexdocs.pm/websock_adapter/")
    (license license:expat)))

(define-public elixir-websock
  (package
    (name "elixir-websock")
    (version "0.5.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "websock" version))
       (sha256
        (base32 "0lxlp1h18595nqczfg15iy34kw5xbbab3yk6ml9cf8mcgwyla1b1"))))
    (build-system mix-build-system)
    (synopsis "Specification for WebSocket connections")
    (description
     "This package provides a specification for @code{WebSocket} connections.")
    (home-page "https://hexdocs.pm/websock/")
    (license license:expat)))

(define-public elixir-x509
  (package
    (name "elixir-x509")
    (version "0.8.9")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "x509" version))
       (sha256
        (base32 "0q8ny5wghdl1h86dqws18gq39jcwx31s422rqjr9q68ahxmb2gza"))))
    (build-system mix-build-system)
    (synopsis
     "Elixir package for working with X.509 certificates")
    (description
     "Elixir package for working with X.509 certificates, Certificate Signing Requests
(CSRs), Certificate Revocation Lists (CRLs) and RSA/ECC key pairs.")
    (home-page "https://hexdocs.pm/x509/")
    (license license:bsd-3)))

;; These live here just because they depend on elixir-plug and elixir-mint.

(define-public elixir-error-message
  (package
    (name "elixir-error-message")
    (version "0.3.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "error_message" version))
       (sha256
        (base32 "1ynqba5rbai6md574k0k76achaaqzznzv0gm2awdbxqqqvq1phxk"))))
    (build-system mix-build-system)
    (native-inputs (list elixir-excoveralls))
    (propagated-inputs (list elixir-jason elixir-plug))
    (synopsis "Make errors consistent across your system")
    (description
     "Error system to help make errors consistent across your system.")
    (home-page "https://hexdocs.pm/error_message/")
    (license license:expat)))

(define-public elixir-ecto-shorts
  (package
    (name "elixir-ecto-shorts")
    (version "2.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ecto_shorts" version))
       (sha256
        (base32 "1r7cc0dhhvmqnwicrnay9lsaf2xahr919g993rbbakdca2xw0q3l"))))
    (build-system mix-build-system)
    (native-inputs (list elixir-credo elixir-excoveralls))
    (propagated-inputs (list elixir-ecto-sql elixir-error-message))
    (synopsis
     "Helper tools for making ecto interactions shorter")
    (description
     "Helper tools for making ecto interactions more pleasant and shorter.")
    (home-page "https://hexdocs.pm/ecto_shorts/")
    (license license:expat)))

(define-public elixir-tz
  (package
    (name "elixir-tz")
    (version "0.28.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "tz" version))
       (sha256
        (base32 "12lchkhdxbv8ai09i2lsy394yx1xrfq1yz5p8dn3qr0236ma3p5z"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-castore elixir-mint))
    (synopsis "Time zone support for Elixir")
    (description "Time zone support for Elixir.")
    (home-page "https://hexdocs.pm/tz/")
    (license license:asl2.0)))

(define-public elixir-ex-cldr-dates-times
  (package
    (name "elixir-ex-cldr-dates-times")
    (version "2.20.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ex_cldr_dates_times" version))
       (sha256
        (base32 "18g5ns5m30hisr58raaq0xzx3gw9bjvaznw0mza2092dyj9i9zjj"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-calendar-interval
           elixir-ex-cldr
           elixir-ex-cldr-calendars
           elixir-ex-cldr-units
           elixir-jason
           elixir-tz))
    (synopsis
     "Date, Time and DateTime localization, internationalization and formatting")
    (description
     "Date, Time and @code{DateTime} localization, internationalization and formatting
functions using the Common Locale Data Repository (CLDR).")
    (home-page "https://hexdocs.pm/ex_cldr_dates_times/")
    (license license:asl2.0)))
