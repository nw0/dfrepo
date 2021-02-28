;;; init-rust.el --- Rust mode                       -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

;; Found this to be faster than rust-mode
(use-package rust-mode
  :straight t
  :defer t
;;  :mode "\\.rs\\'"
  :bind (:map rust-mode-map ("M-<return>" . comment-indent-new-line))
  :config
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq rust-format-on-save nil))

;; Doesn't work, json-read-error
(use-package flycheck-rust
  :straight t
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))


(provide 'init-rust)
;;; init-rust.el ends here
