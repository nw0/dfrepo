;;; init-python.el --- Python                        -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package python
  :mode ("[./]flake8\\'" . conf-mode)
  :mode ("/Pipfile\\'" . conf-mode)
  :mode ("\\.py\\'" . python-mode)
  :bind (:map python-mode-map
              ([remap backward-delete-char-untabify] . smart-hungry-delete-backward-char)
	            ([remap delete-backward-char] . smart-hungry-delete-backward-char)
	            ([remap delete-char] . smart-hungry-delete-forward-char))
  :config
  (setq python-basic-offset 4
        python-indent-offset 4)
  (flycheck-define-checker
      python-mypy ""
      :command ("mypy"
                "--ignore-missing-imports" "--fast-parser"
                "--python-version" "3.7"
                source-original)
      :error-patterns
      ((error line-start (file-name) ":" line ": error:" (message) line-end))
      :modes python-mode)
  (add-to-list 'flycheck-checkers 'python-mypy t)
  (flycheck-add-next-checker 'python-pylint 'python-mypy t))

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(use-package pyimport
  :defer t)

(provide 'init-python)
;;; init-python.el ends here
