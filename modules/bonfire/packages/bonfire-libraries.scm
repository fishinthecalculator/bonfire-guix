;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages bonfire-libraries)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix)
  #:use-module (bonfire packages elixir-databases))

(define-public bonfire-data-edges
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
      (license license:agpl3))))

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
