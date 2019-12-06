(global-prettify-symbols-mode t)    ; nice lambda symbols
(electric-pair-mode 1)              ; auto-insert closing parens, and more

(setq-default tab-width 4
              tab-stop-list '(4 8 12)
              indent-tabs-mode nil
              show-trailing-whitespace t)

(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
         ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks))
