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
      (native-inputs (list elixir-mess))
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
      (native-inputs (list elixir-mess))
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
      (native-inputs (list elixir-mess))
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

(define-public elixir-mess
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
