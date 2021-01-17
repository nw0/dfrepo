;;; init-theme.el --- Load themes                    -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package autothemer
  :straight t)
(load-theme 'contrast t)

(use-package smart-mode-line
  :straight t
  :config (sml/setup))


(provide 'init-theme)
;;; init-theme.el ends here
