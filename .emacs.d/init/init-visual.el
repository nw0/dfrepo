;;; init-visual.el --- Interface options             -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

;; relative numbering
(line-number-mode 1)                ; default, but be sure
(when (>= emacs-major-version 26)
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode))

(column-number-mode 1)              ; in the modeline

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)


;;; Highlights
(global-prettify-symbols-mode t)    ; nice lambda symbols
(global-font-lock-mode t)       ; syntax highlighting
(global-hl-line-mode t)         ; don't get lost
(show-paren-mode t)             ; highlight matching parentheses
(setq show-paren-delay 0.0
      blink-matching-paren nil)

(use-package highlight-symbol
  :straight t
  :diminish
  :bind (
         :map highlight-symbol-nav-mode-map
         ("M-p" . nil)
         ("M-n" . nil))
  :hook ((prog-mode . highlight-symbol-mode)
         (prog-mode . highlight-symbol-nav-mode))
  :config
  (setq highlight-symbol-idle-delay 0.8
        hightlight-symbol-on-navigation-p t))

(use-package hl-todo
  :straight t
  :diminish
  :config
  (setq hl-todo-keyword-faces
        '(("TODO"   . "red")
          ("FIXME"  . "orange")
          ("DEBUG"  . "dodger blue")
          ("GOTCHA" . "salmon")
          ("STUB"   . "purple")))
  (global-hl-todo-mode))

(use-package rainbow-mode
  :straight t
  :diminish
  :config
  (setq rainbow-x-colors nil)
  (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package diff-hl
  :straight t
  :after magit
  :init
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1))


(provide 'init-visual)
;;; init-visual.el ends here
