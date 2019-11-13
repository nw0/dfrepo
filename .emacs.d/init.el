;; -*- mode: emacs-lisp -*-

;; Always load packages first!
;; Package: elpa, melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Disable the splash screen (to enable it again, replace the t with 0)
;; This messes with line numbering and who knows what else
(setq inhibit-splash-screen t)

;; Custom things
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-file "~/.emacs.d/interface.el")
(load-file "~/.emacs.d/org.el")
