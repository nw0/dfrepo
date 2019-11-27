;; use utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8
      coding-system-for-write 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(global-prettify-symbols-mode t)    ; nice lambda symbols
(electric-pair-mode 1)              ; auto-insert closing parens, and more

(setq-default tab-width 4
              tab-stop-list '(4 8 12)
              indent-tabs-mode nil
              show-trailing-whitespace t)
(setq require-final-newline t)      ; less insanity
(add-hook 'before-save-hook 'whitespace-cleanup)    ; no more trailing ws

;; amazing completion
(use-package company
  :ensure t
  :diminish company-mode
  :hook (after-init . global-company-mode)
  )

(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
         ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks))
