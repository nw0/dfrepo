;;; init-cleanup.el --- Unset annoying defaults. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      ring-bell-function 'ignore
      sentence-end-double-space nil
      fill-column 79)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package diminish
  :config
  (diminish 'eldoc-mode)
  (diminish 'visual-line-mode))

(use-package undo-tree
  :diminish)

;;; Graphical
(blink-cursor-mode -1)
(tooltip-mode -1)

(provide 'init-cleanup)
;;; init-cleanup.el ends here
