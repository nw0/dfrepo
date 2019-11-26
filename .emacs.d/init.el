;; -*- mode: emacs-lisp -*-

(load-file "~/.emacs.d/packages.el")
;; Custom things
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-file "~/.emacs.d/org.el")
(load-file "~/.emacs.d/interface.el")
(load-file "~/.emacs.d/edit.el")
(load-file "~/.emacs.d/evil.el")

;; less frequent garbage collection
(setq gc-cons-threshold (* 100 1024 1024)) ;; 100 mb
;; Allow font-lock-mode to do background parsing
(setq jit-lock-stealth-time 1
      ;; jit-lock-stealth-load 200
      jit-lock-chunk-size 1000
      jit-lock-defer-time 0.05)
;; this helps org-bullets (and other unicode things?) load faster
(setq inhibit-compacting-font-caches t)
