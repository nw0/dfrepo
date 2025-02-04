;;; init-lang.el --- Default programming config. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Assume Emacs 29 - with built-in treesit
(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'nil)
  (global-treesit-auto-mode))

;; Miscellaneous languages not belonging to their own files follow


(use-package irony
  :hook (c++-mode . irony-mode)
  :hook (c-mode . irony-mode)
  :hook (objc-mode . irony-mode)
  :config
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map
                [remap completion-at-point] 'counsel-irony)
    (define-key irony-mode-map
                [remap complete-symbol] 'counsel-irony))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(add-hook 'java-mode-hook
          (lambda()
            (setq c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode t)))


(provide 'init-lang)
;;; init-lang.el ends here
