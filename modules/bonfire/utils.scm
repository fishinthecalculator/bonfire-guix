;;; SPDX-License-Identifier: GPL-3.0-or-later
;;; Copyright © 2024 Giacomo Leidi <goodoldpaul@autistici.org>

(define-module (bonfire utils)
  #:use-module (gnu packages)
  #:export (bonfire-search-patches))

(define-syntax bonfire-search-patches
  (syntax-rules ()
    ((_ e ...)
     (parameterize
         ((%patch-path
           (map (lambda (directory)
                  (string-append directory "/bonfire/packages/patches"))
                %load-path)))
       (search-patches e ...)))))
