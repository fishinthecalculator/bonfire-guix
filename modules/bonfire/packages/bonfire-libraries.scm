;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages bonfire-libraries)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix)
  #:use-module (bonfire packages elixir-databases)
  #:use-module (bonfire packages elixir-web)
  #:use-module (bonfire packages elixir-xyz))

(define-public bonfire-data-access-control.git
  (let ((version "0.4.0")
        (revision "0")
        (commit "de2ca8f732499b4df8f5a9711f7b7bb38df76609"))
    (package
      (name "bonfire-data-access-control")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_data_access_control.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0pfyb6si4sbzg9f8psw5lgz0h7jl29limc48sjc82lxq53nv22fr"))))
      (build-system mix-build-system)
      (arguments
       ;; There are no tests.
       (list #:tests? #f))
      (native-inputs (list elixir-mess.git))
      (propagated-inputs (list elixir-needle))
      (synopsis
       "Implements @code{Bonfire.Data.AccessControl}")
      (description
       "This package provides @code{bonfire-data-access-control}, a library implementing
@code{Bonfire.Data.AccessControl}, @code{Bonfire.Boundaries} and related.")
      (home-page "https://github.com/bonfire-networks/bonfire_data_access_control")
      (license license:mpl2.0))))

(define-public bonfire-data-identity.git
  (let ((version "0.4.0")
        (revision "0")
        (commit "89fdedc78b9fdbebbebef7aff04155d34fb29877"))
    (package
      (name "bonfire-data-identity")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_data_identity.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1p4q2k4wz3c261p3xyp21vhg32n9c5zjlmwchqyifdmymfhvq3m1"))))
      (build-system mix-build-system)
      (arguments
       ;; There are no tests.
       (list #:tests? #f))
      (native-inputs (list elixir-mess.git))
      (propagated-inputs (list bonfire-data-edges.git
                               elixir-ecto-sparkles
                               elixir-needle
                               elixir-untangle))
      (synopsis
       "Schemas for accounts, users, etc")
      (description
       "This package provides @code{bonfire-data-identity}, a library implementing
@code{Bonfire.Data.Edges.Identity} and related.")
      (home-page "https://github.com/bonfire-networks/bonfire_data_identity")
      (license license:mpl2.0))))

(define-public bonfire-data-edges.git
  (let ((version "0.4.0")
        (revision "0")
        (commit "224212f3eb98bb2a534b4241b92b30dc30d0580b"))
    (package
      (name "bonfire-data-edges")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/bonfire_data_edges.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "1vz7b8sjx03bcm4afbwarjpfmz8dl4pnqv95qjcwycm9gqvz13yz"))))
      (build-system mix-build-system)
      (native-inputs (list elixir-mess.git))
      (propagated-inputs (list elixir-needle))
      (synopsis
       "Implements @code{Bonfire.Data.Edges.Edge}")
      (description
       "This package provides @code{bonfire-data-edges}, a library implementing
@code{Bonfire.Data.Edges.Edge} and related.")
      (home-page "https://github.com/bonfire-networks/bonfire_data_edges")
      (license license:mpl2.0))))

(define-public elixir-ecto-sparkles
  (package
    (name "elixir-ecto-sparkles")
    (version "0.2.1")
    (source
     (origin
       (method url-fetch)
       (uri (hexpm-uri "ecto_sparkles" version))
       (sha256
        (base32 "1ry89mk103jpv73971lwx3vmn9n6zd3ycya1ac1pr3r53f4hmkb0"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-ecto
           elixir-ecto-dev-logger
           elixir-ecto-sql
           elixir-html-sanitize-ex
           elixir-recase
           elixir-untangle))
    (synopsis
     "Helper library to better join + preload Ecto associations")
    (description
     "This package provides andhelper library to better join + preload Ecto
associations, and other goodies.")
    (home-page "https://hexdocs.pm/ecto_sparkles/")
    (license license:asl2.0)))

(define-public elixir-mess.git
  (let ((version "0.0.0")
        (revision "0")
        (commit "bfe6e3c56c5237017c7fd0fd8d8d804bec267ca6"))
    (package
      (name "elixir-mess")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/mess.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0ql3lz4y7wfd4cl2dpdr63qh5vrqc6bpf1154yjcgpf947w0784y"))))
      (build-system mix-build-system)
      (synopsis
       "Simple, file-based dependency management with git and local overrides")
      (description
       "@code{mess} implements simple, file-based dependency management with git
and local overrides.")
      (home-page "https://github.com/bonfire-networks/mess")
      (license license:mpl2.0))))

(define-public elixir-needle-uid.git
  (let ((version "0.0.1")
        (revision "0")
        (commit "9b3cfcba18322cec0595fa51f90489001381f47b"))
    (package
    (name "elixir-needle-uid")
    (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/needle_uid.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "07swqkqvd1p5djylgqs4n4xb71cih7iazzvakfz24s4qwysc5fnc"))))
    (build-system mix-build-system)
    (arguments
     ;; Tests appear to be broken on main
     ;; 9 doctests, 24 tests, 20 failures
     (list #:tests? #f))
    (propagated-inputs
     (list elixir-ecto
           elixir-needle-ulid
           elixir-pride.git
           elixir-untangle))
    (synopsis
     "Hybrid prefixed UUIDv7 and ULID data type for Ecto")
    (description
     "This package provides hybrid prefixed UUIDv7 and ULID data type for Ecto
(using @code{elixir-pride} and @code{elixir-needle-ulid})")
    (home-page "https://github.com/bonfire-networks/needle_uid")
    (license license:expat))))

(define-public elixir-pride.git
  (let ((version "0.0.1")
        (revision "0")
        (commit "82798ea71e703e283b2e9a3e8cdbc80035ad1468"))
    (package
    (name "elixir-pride")
    (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/pride.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0y0mx7a972z11zxncbxvifp16inss6d5az8ij26qx4ry5xcrijp8"))))
    (build-system mix-build-system)
    (propagated-inputs
     (list elixir-ecto
           elixir-ecto-sql
           elixir-untangle
           elixir-uuidv7))
    (synopsis
     "Prefixed UUIDv7 data type for Ecto")
    (description
     "This package provides a prefixed UUIDv7 data type for Ecto, and related
helpers.")
    (home-page "https://github.com/bonfire-networks/pride")
    (license license:expat))))
