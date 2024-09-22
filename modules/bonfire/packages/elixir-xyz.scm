;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages elixir-xyz)
  #:use-module (gnu packages gettext)
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

(define-public elixir-arrows
  (package
    (name "elixir-arrows")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "arrows" version))
       (sha256
        (base32 "11b0ircig7ypzlz6kk14fv5kw3pc7s0fqs5crgbl0vac12qs02ac"))))
    (build-system mix-build-system)
    (synopsis "Handful of (mostly) arrow macros")
    (description "This package provides @code{elixir-arrows}, a library
implementing a handful of (mostly) arrow macros.")
    (home-page "https://hexdocs.pm/arrows/")
    (license license:asl2.0)))

(define-public elixir-assert-value
  (package
    (name "elixir-assert-value")
    (version "0.10.4")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "assert_value" version))
       (sha256
        (base32 "1h6jn7v6jiyx27qibmh2ami2l1ywzl14q9jbn1bw5wmz5ckq89w0"))))
    (build-system mix-build-system)
    (synopsis
     "@code{ExUnit}'s assert that writes and updates tests for you")
    (description
     "@code{ExUnit's} assert that writes and updates tests for you.")
    (home-page "https://hexdocs.pm/assert_value/")
    (license license:expat)))

(define-public elixir-beam-file
  (package
    (name "elixir-beam-file")
    (version "0.6.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "beam_file" version))
       (sha256
        (base32 "0mlwrh5sxvz36qqqwbyhqz9xyx93c3bv04vjmpf4wrxdba79xa89"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls elixir-recode))
    (synopsis "Interface to the BEAM file format and a decompiler")
    (description "An interface to the BEAM file format and a decompiler.")
    (home-page "https://hexdocs.pm/beam_file/")
    (license license:expat)))

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

(define-public elixir-decorator
  (package
    (name "elixir-decorator")
    (version "1.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "decorator" version))
       (sha256
        (base32 "0zsrasbf6z3g7xs1s8gk5g7rf49ng1dskphqfif8gnl3j3fww1qa"))))
    (build-system mix-build-system)
    (synopsis "Function decorators for Elixir")
    (description "This package provides @code{elixir-decorator}, a library
implementing function decorators for Elixir.")
    (home-page "https://hexdocs.pm/decorator/")
    (license license:expat)))

(define-public elixir-escape
  (package
    (name "elixir-escape")
    (version "0.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "escape" version))
       (sha256
        (base32 "1kcifh2b6g5h3lh79m3hsmskh8xm07a0c4xwakgmawb7nhnykn55"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-prove))
    (synopsis "ANSI escape tool")
    (description "An ANSI escape tool.")
    (home-page "https://hexdocs.pm/escape/")
    (license license:expat)))

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

(define-public elixir-expo
  (package
    (name "elixir-expo")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "expo" version))
       (sha256
        (base32 "0q692ycwn0f5kif55vxhx2bq1swyraypf89n671l9yq08wzzkbgv"))))
    (build-system mix-build-system)
    (synopsis
     "Low-level Gettext file handling")
    (description
     "This package implements low-level Gettext file handling (.po/.pot/.mo file
writer and parser).")
    (home-page "https://hexdocs.pm/expo/")
    (license license:asl2.0)))

(define-public elixir-faker
  (package
    (name "elixir-faker")
    (version "0.18.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "faker" version))
       (sha256
        (base32 "15qpx2rvapffjq8zsk720nnm3rhn91y33jcyx642g3npb0wxigdz"))))
    (build-system mix-build-system)
    (synopsis "Generate fake data")
    (description "Faker is a pure Elixir library for generating fake data.")
    (home-page "https://hexdocs.pm/faker/")
    (license license:expat)))

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

(define-public elixir-gettext
  (package
    (name "elixir-gettext")
    (version "0.26.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "gettext" version))
       (sha256
        (base32 "0d47y25shkpfw5qyai4p9w9cfaxd55jksy2j19w2ip5ri3qmdkh1"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-castore
           elixir-excoveralls
           elixir-jason))
    (inputs
     (list gnu-gettext))
    (propagated-inputs (list elixir-expo))
    (synopsis "Internationalization and localization through gettext")
    (description "This package implements internationalization and localization
through gettext.")
    (home-page "https://hexdocs.pm/gettext/")
    (license license:asl2.0)))

(define-public elixir-glob-ex
  (package
    (name "elixir-glob-ex")
    (version "0.1.8")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "glob_ex" version))
       (sha256
        (base32 "0r64861dbv1gcyk1zpfalhxc8h0lk11hl9n96yln16j154bx0fcy"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on prove from hex.pm, which is not packaged yet.
     (list #:tests? #f))
    (synopsis "Library for glob expressions.")
    (description "This package provides a library for glob expressions.")
    (home-page "https://hexdocs.pm/glob_ex/")
    (license license:expat)))

(define-public elixir-mime
  (package
    (name "elixir-mime")
    (version "2.0.6")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mime" version))
       (sha256
        (base32 "0ghmkcyx3lcgzrjasf51k42d628fiqzn9hxai5rp8vdjlrim7569"))))
    (build-system mix-build-system)
    (synopsis "MIME type module")
    (description "This package provides @code{elixir-mime}, a MIME type module
for Elixir.")
    (home-page "https://hexdocs.pm/mime/")
    (license license:asl2.0)))

(define-public elixir-mneme
  (package
    (name "elixir-mneme")
    (version "0.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mneme" version))
       (sha256
        (base32 "1rvdimi80cr34vr7i7vmihf40l7r3pyznhr66ncmrch7bphj1xj0"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on elixir-ecto, they are turned off to avoid circular Guile
     ;; modules dependencies.
     (list #:tests? #f))
    (propagated-inputs
     (list elixir-nimble-options
           elixir-owl
           elixir-rewrite
           elixir-sourceror))
    (synopsis "Snapshot testing tool")
    (description "This package implements a snapshot testing tool using familiar
assertions.")
    (home-page "https://hexdocs.pm/mneme/")
    (license license:expat)))

(define-public elixir-mox
  (package
    (name "elixir-mox")
    (version "1.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "mox" version))
       (sha256
        (base32 "16h84745x12h7zrw305mzi93q092pvblr55gxrz4mqlyqqy2pff7"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-castore
           elixir-excoveralls))
    (propagated-inputs (list elixir-nimble-ownership))
    (synopsis "Mocks and explicit contracts")
    (description "Mocks and explicit contracts for Elixir.")
    (home-page "https://hexdocs.pm/mox/")
    (license license:asl2.0)))

(define-public elixir-nimble-options
  (package
    (name "elixir-nimble-options")
    (version "1.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "nimble_options" version))
       (sha256
        (base32 "0i0bcmpsc02ga2llakgcvnw734rqn2dzx0j8k2vc8hllr9q286w2"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-castore
           elixir-excoveralls))
    (synopsis
     "Validates and documents high-level options")
    (description
     "This package provides a tiny library for validating and documenting high-level
options.")
    (home-page "https://hexdocs.pm/nimble_options/")
    (license license:asl2.0)))

(define-public elixir-nimble-ownership
  (package
    (name "elixir-nimble-ownership")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "nimble_ownership" version))
       (sha256
        (base32 "1k5jdkarlvnqr6g4is5cnyqyhwx2aysmac574114clp9yiscq5kw"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-castore elixir-excoveralls))
    (synopsis "Track ownership of resources across processes")
    (description "Track ownership of resources across processes.")
    (home-page "https://hexdocs.pm/nimble_ownership/")
    (license license:asl2.0)))

(define-public elixir-owl
  (package
    (name "elixir-owl")
    (version "0.11.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "owl" version))
       (sha256
        (base32 "1zjylqrqvklfnys5zmdzqkh9mr5kvfh1grqv0r5c0g4n1qzpixbk"))))
    (build-system mix-build-system)
    (native-inputs (list elixir-excoveralls))
    (propagated-inputs (list elixir-ucwidth))
    (synopsis "Toolkit for writing command-line user interfaces")
    (description
     "This package provides a toolkit for writing command-line user interfaces.")
    (home-page "https://hexdocs.pm/owl/")
    (license license:asl2.0)))

(define-public elixir-prove
  (package
    (name "elixir-prove")
    (version "0.1.7")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "prove" version))
       (sha256
        (base32 "1hkw70cbq82jjyyqdiaspi5a9v4m7z625h9z9hym0p1ziml25k2r"))))
    (build-system mix-build-system)
    (synopsis
     "Provides the macros @code{prove} and @code{batch}")
    (description
     "Prove provides the macros @code{prove} and @code{batch} to write simple
tests shorter.")
    (home-page "https://hexdocs.pm/prove/")
    (license license:expat)))

(define-public elixir-recase
  (package
    (name "elixir-recase")
    (version "0.8.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "recase" version))
       (sha256
        (base32 "1hp4sl3wavz2nb29azjkjayjp2vp0pin88xihnirxga3gqzddn4z"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls))
    (synopsis "Convert strings to any case you need.")
    (description "@code{Recase} helps you to convert a string from any case to
any case.")
    (home-page "https://hexdocs.pm/recase/")
    (license license:expat)))

(define-public elixir-recode
  (package
    (name "elixir-recode")
    (version "0.7.3")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "recode" version))
       (sha256
        (base32 "1n3gqgcl1qx5h1z9yqx28nbavgydvivm3cr3qifnbdwry07zb365"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls elixir-mox))
    (propagated-inputs
     (list elixir-escape elixir-glob-ex elixir-rewrite))
    (synopsis "Experimental linter with autocorrection.")
    (description "An experimental linter with autocorrection.")
    (home-page "https://hexdocs.pm/recode/")
    (license license:expat)))

(define-public elixir-rewrite
  (package
    (name "elixir-rewrite")
    (version "0.10.5")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "rewrite" version))
       (sha256
        (base32 "0krxpxg67d2q8fb1amig10mk164imkdj4h9cg8g3mbb989x39k2i"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls))
    (propagated-inputs (list elixir-glob-ex elixir-sourceror))
    (synopsis
     "Rewrite sources in an Elixir project")
    (description
     "This package implements an API for rewriting sources in an Elixir project
powered by sourceror.")
    (home-page "https://hexdocs.pm/rewrite/")
    (license license:expat)))

(define-public elixir-sourceror
  (package
    (name "elixir-sourceror")
    (version "1.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "sourceror" version))
       (sha256
        (base32 "16gnj7wy7hfjzzp76rsmwp9kqd7w2qa3vy4fkk435kysha6fy2p9"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-excoveralls))
    (synopsis "Utilities to work with Elixir source code")
    (description "This package provides @code{elixir-sourceror}, a library
implementing utilities to work with Elixir source code.")
    (home-page "https://hexdocs.pm/sourceror/")
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

(define-public elixir-telemetry-metrics
  (package
    (name "elixir-telemetry-metrics")
    (version "1.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "telemetry_metrics" version))
       (sha256
        (base32 "0pbxsk8j3d9nwj6130lmmrlcmg4yjm66s4h5w0sab1kjhjri6dzj"))))
    (build-system mix-build-system)
    (propagated-inputs (list erlang-telemetry))
    (synopsis
     "Common interface for defining metrics based on Telemetry events")
    (description
     "This package provides a common interface for defining metrics based on Telemetry
events.")
    (home-page "https://hexdocs.pm/telemetry_metrics/")
    (license license:asl2.0)))

(define-public elixir-thousand-island
  (package
    (name "elixir-thousand-island")
    (version "1.3.5")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "thousand_island" version))
       (sha256
        (base32 "107195wci96qdykkpw2x7c3bil3mdmmznf9jmxb4gzpx2r4rbrib"))))
    (build-system mix-build-system)
    (native-inputs
     (list elixir-jason))
    (propagated-inputs (list elixir-machete erlang-telemetry))
    (synopsis "Pure Elixir socket server")
    (description
     "This package provides a simple and modern Elixir socket server.")
    (home-page "https://hexdocs.pm/thousand_island/")
    (license license:expat)))

(define-public elixir-ucwidth
  (package
    (name "elixir-ucwidth")
    (version "0.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ucwidth" version))
       (sha256
        (base32 "1gsmfcbrdfa00czm8870pr3kc34wvnisyg7c5gxi3swfidwx3vy1"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests depend on elixir-quixir which is not packaged yet.
     (list #:tests? #f))
    (synopsis
     "Port of ucwidth from C to Elixir")
    (description
     "This package provides a port of ucwidth from C to Elixir, for determining the
width (full-width or half-width) of an Unicode character.")
    (home-page "https://hexdocs.pm/ucwidth/")
    (license license:expat)))

(define-public elixir-untangle
  (package
    (name "elixir-untangle")
    (version "0.3.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "untangle" version))
       (sha256
        (base32 "0w9r88fisvp0mg7b5qbr5dqv58kpn845ladikrbjwrbrhf2arbi5"))))
    (build-system mix-build-system)
    (propagated-inputs (list elixir-decorator))
    (synopsis "Logging and inspecting with code location information")
    (description "Untangle provides alternatives for @code{IO.inspect} and the
macros in Elixir's @code{Logger} to output code location information.  It also
provides a polyfill for @code{dbg} which was introduced in Elixir 1.14.")
    (home-page "https://hexdocs.pm/untangle/")
    (license license:asl2.0)))

(define-public elixir-verbs
  (package
    (name "elixir-verbs")
    (version "0.6.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "verbs" version))
       (sha256
        (base32 "19nbkwrphns1yjk0rca1zq6v43m878r7750ppf4av3kcf58328hr"))))
    (build-system mix-build-system)
    (synopsis "Conjugates English verbs")
    (description "This package provides a library to conjugate English verbs.")
    (home-page "https://hexdocs.pm/verbs/")
    (license license:expat)))

(define-public elixir-zest
  (package
    (name "elixir-zest")
    (version "0.1.2")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "zest" version))
       (sha256
        (base32 "0jlpldb94wm1v2kavvsy5h7w5mvjmxnkssl48mp2iphmysnddqpb"))))
    (build-system mix-build-system)
    (synopsis "Fresh approach to testing in Elixir")
    (description "This package provides a fresh approach to testing.")
    (home-page "https://hexdocs.pm/zest/")
    (license license:asl2.0)))

(define-public elixir-zstream
  (package
    (name "elixir-zstream")
    (version "0.6.4")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "zstream" version))
       (sha256
        (base32 "18fr77k6y8bix2xwaxpbxzw31dy1kp5p5sc5igz2rsxrdmdw7imc"))))
    (build-system mix-build-system)
    (synopsis "Streaming zip file writer and reader")
    (description "This package provides a streaming zip file writer and reader.")
    (home-page "https://hexdocs.pm/zstream/")
    (license license:expat)))
