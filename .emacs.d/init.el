;; -*- mode: emacs-lisp -*-

;; Always load packages first!
;; Package: elpa, melpa
(setq gnutls-min-prime-bits 4096)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Disable the splash screen (to enable it again, replace the t with 0)
;; This messes with line numbering and who knows what else
(setq inhibit-splash-screen t
      sentence-end-double-space nil)

;; Custom things
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-file "~/.emacs.d/interface.el")
(load-file "~/.emacs.d/org.el")

;; less frequent garbage collection
(setq gc-cons-threshold (* 100 1024 1024)) ;; 100 mb
;; Allow font-lock-mode to do background parsing
(setq jit-lock-stealth-time 1
      ;; jit-lock-stealth-load 200
      jit-lock-chunk-size 1000
      jit-lock-defer-time 0.05)