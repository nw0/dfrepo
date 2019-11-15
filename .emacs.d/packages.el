;; Always load packages first!
;; Package: elpa, melpa
(setq package-enable-at-startup nil
      gnutls-min-prime-bits 4096)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; we need use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
