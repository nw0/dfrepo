;; User interface settings

;; Line numbering
(when (>= emacs-major-version 26)
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode))

;; Some simple settings
(transient-mark-mode 1)
(delete-selection-mode t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
; (global-auto-revert-mode t)
(global-prettify-symbols-mode t)

(show-paren-mode t)
(setq show-paren-delay 0.0)
(setq-default tab-width 4)
(setq require-final-newline t)

;; ahh
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

;; Theme: this won't load properly if it's before custom-safe-themes
;; alternatively, unconditionally load with t
(load-theme 'gruvbox)

;; for graphical emacs
(set-face-attribute 'default nil :height 140)
