;;; init-lsp.el --- LSP mode                         -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l"
              lsp-print-performance t)
  :hook ((rust-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (setq lsp-rust-server 'rust-analyzer)
  (setq lsp-ui-doc-enable nil
        lsp-idle-delay 0.8
        lsp-signature-auto-activate nil))

(use-package lsp-ui)

(use-package lsp-ivy)


(provide 'init-lsp)
;;; init-lsp.el ends here
