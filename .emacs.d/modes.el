;; python
(use-package anaconda-mode
  :ensure t
  :after smart-hungry-delete
  :diminish
  :hook (python-mode . anaconda-mode)
  :bind (:map python-mode-map
              ([backspace] . (lambda (&optional arg)
                               "Call `smart-hungry-delete-backward-char' unless point is directly after the indentation, in which case call `python-indent-dedent-line-backspace'."
                               (interactive)
                               (if (looking-back "^[\t ]+")
                                   (python-indent-dedent-line-backspace arg)
                                 (smart-hungry-delete-backward-char arg)))))
  :config
  (setq tab-width 4
        python-basic-offset 4
        python-indent-offset 4))

(use-package company-anaconda
  :ensure t
  :after (company anaconda-mode)
  :config
  (add-to-list 'company-backends 'company-anaconda))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; ledger
(use-package ledger-mode
  :ensure t)
