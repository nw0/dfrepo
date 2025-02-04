;;; init-markup.el --- Markup modes                  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package adoc-mode)

(use-package asciidoc)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package toml-mode)

(use-package yaml-mode
  :hook
  (yaml-mode . (lambda () (mixed-pitch-mode -1))))

(provide 'init-markup)
;;; init-markup.el ends here
