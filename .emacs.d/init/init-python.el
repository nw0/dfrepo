;;; init-python.el --- Python                        -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package python
  :mode ("[./]flake8\\'" . conf-mode)
  :mode ("/Pipfile\\'" . conf-mode)
  ;; :bind (:map python-mode
  ;;              ("C-<backspace>" . (lambda (&optional arg)
  ;;                                   "Call `smart-hungry-delete-backward-char' unless point is directly after the indentation, in which case call `python-indent-dedent-line-backspace'."
  ;;                                   (interactive)
  ;;                                   (if (looking-back "^[\t ]+")
  ;;                                       (python-indent-dedent-line-backspace arg)
  ;;                                     (smart-hungry-delete-backward-char arg)))))
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
  :straight t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(use-package poetry
  :straight t
  :hook (python-mode . poetry-tracking-mode))

(use-package pyimport
  :straight t
  :defer t)

(provide 'init-python)
;;; init-python.el ends here
