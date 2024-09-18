;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire packages bonfire-libraries)
  #:use-module (guix git-download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (bonfire guix build-system mix))

(define-public mess
  (let ((version "0.0.0")
        (revision "0")
        (commit "e51e36eed4a6e578350d2c7b10d38c469f4daa5e"))
    (package
      (name "mess")
      (version (git-version version revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/bonfire-networks/mess.git")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "14j9qid86hdd6vfis5a64yjnhzjc673pnhpscxcsiv5p5x930xq7"))))
      (build-system mix-build-system)
      (synopsis
       "Simple, file-based dependency management with git and local overrides")
      (description
       "@code{mess} implements simple, file-based dependency management with git
and local overrides.")
      (home-page "https://github.com/bonfire-networks/mess")
      (license license:mpl2.0))))
