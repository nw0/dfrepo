;;; init.el --- New init                             -*- lexical-binding: t; -*-

;; Copyright (C) 2024  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

;; adjust gc thresholds to start up faster
(let ((normal-gc-cons-threshold (* 128 1024 1024))
      (init-gc-cons-threshold (* 256 1024 1024))
      (normal-gc-cons-percentage 0.2)
      (init-gc-cons-percentage 10.0))

  (setq gc-cons-threshold init-gc-cons-threshold
        gc-cons-percentage init-gc-cons-percentage
        read-process-output-max (* 1024 1024))
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold
                        gc-cons-percentage normal-gc-cons-percentage
                        jit-lock-stealth-time 1
                        ;; jit-lock-stealth-load 200
                        jit-lock-chunk-size 1000
                        jit-lock-defer-time 0.05
                        inhibit-compacting-font-caches t))))
;; gc-config end - back to normal config

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-util)
(require 'init-pkg)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'init-cleanup)
(require 'init-theme)
(require 'init-editor)
(require 'init-visual)
(require 'init-interface)

;; Projectile, dired, magit, Fly*
(require 'init-project)

;; Programming modes
(require 'init-lang)
(require 'init-lsp)
(require 'init-elisp)
(require 'init-rust)
(require 'init-python)
(require 'init-markup)


(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

;; modes -- all the modes
;; org mode, org roam
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 135
                    :weight 'normal
                    :width 'normal)

(use-package pangu-spacing
  :diminish
  :config
  (global-pangu-spacing-mode 1))

(use-package ledger-mode
  :hook (ledger-mode . (lambda () (mixed-pitch-mode -1))))

(use-package explain-pause-mode
  :straight (explain-pause-mode :type git :host github :repo "lastquestion/explain-pause-mode")
  :diminish
  :config
  (explain-pause-mode))


; (use-package tex
;   :hook ((tex-mode . lsp-deferred)
;          (latex-mode . lsp-deferred)))
;
; (use-package bibtex
;   :hook (bibtex-mode . lsp-deferred))
;
; (use-package lsp-latex
;   :straight t)


(provide 'new-init)
;;; init.el ends here
