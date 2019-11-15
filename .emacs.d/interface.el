;; User interface settings

;; Line numbering
(when (>= emacs-major-version 26)
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode))

;; use utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; disable a buffer's mark on defocus
(transient-mark-mode 1)
;; Some simple settings
(delete-selection-mode t)
;; (global-auto-revert-mode t)

;; don't show unneeded things
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(line-number-mode 1)
(column-number-mode 1)
;; nice lambdas
(global-prettify-symbols-mode t)
;; syntax highlighting
(global-font-lock-mode t)

;; highlight matching parentheses
(show-paren-mode t)
(setq show-paren-delay 0.0)

(setq-default tab-width 4
              indent-tabs-mode nil)
(setq require-final-newline t)

;; ahh
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

;; Theme: this won't load properly if it's before custom-safe-themes
;; alternatively, unconditionally load with t
(load-theme 'gruvbox)

;; for graphical emacs
(set-face-attribute 'default nil :height 140)
