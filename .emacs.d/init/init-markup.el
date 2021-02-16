;;; init-markup.el --- Markup modes                  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package adoc-mode
  :straight t)

(use-package asciidoc
  :straight t)

(use-package markdown-mode
  :straight t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package toml-mode
  :straight t)

(use-package yaml-mode
  :straight t
  :hook
  (yaml-mode . (lambda () (mixed-pitch-mode -1))))

(provide 'init-markup)
;;; init-markup.el ends here
