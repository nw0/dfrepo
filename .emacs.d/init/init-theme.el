;;; init-theme.el --- Load themes                    -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package solarized-theme
  :straight t
  :custom
  (solarized-distinct-fringe-background t)
  :config
  (load-theme 'solarized-light t))


(provide 'init-theme)
;;; init-theme.el ends here
