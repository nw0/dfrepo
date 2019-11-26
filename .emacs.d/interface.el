;; User interface settings


;; Theme: this won't load properly if it's before custom-safe-themes
(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox))

;; Line numbering
(when (>= emacs-major-version 26)
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode))

;; adapted from https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
(setq delete-old-versions -1            ; delete excess backup versions silently
      version-control t                 ; use version control
      vc-make-backup-files t            ; make backups file even when in version controlled dir
      backup-directory-alist `(("." . "~/.emacs.d/backups"))    ; which directory to put backups file
      vc-follow-symlinks t              ; don't ask for confirmation when opening symlinked file
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t))   ; transform backups file name
      inhibit-startup-screen t          ; inhibit useless and old-school startup screen
      ring-bell-function 'ignore        ; silent bell when you make a mistake
      sentence-end-double-space nil     ; sentence SHOULD end with only a point.
      default-fill-column 79)           ; toggle wrapping text at the 80th character

;; disable a buffer's mark on defocus
(transient-mark-mode 1)
;; Some simple settings
(delete-selection-mode t)
;; (global-auto-revert-mode t)

;; don't show unneeded things
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(line-number-mode 1)                ; default, but be sure
(column-number-mode 1)              ; in the modeline
(blink-cursor-mode -1)              ; this is annoying (graphical only)
(global-font-lock-mode t)           ; syntax highlighting
(global-hl-line-mode t)

(show-paren-mode t)                 ; highlight matching parentheses
(setq show-paren-delay 0.0
      blink-matching-paren nil)


;; ahh
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

;; hide some modes
(use-package diminish
  :ensure t
  :config
  (diminish 'eldoc-mode))

;; like this one
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init (which-key-mode)
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-idle-delay 0.5))


;; git
(use-package magit
  :ensure t)

;; show diffs in gutter
(use-package diff-hl
  :ensure t
  :init
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1))

;; amazing completion
(use-package company
  :ensure t
  :diminish 'company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package mixed-pitch
  :ensure t
  :hook  (text-mode . mixed-pitch-mode))

;; for graphical emacs
(set-face-attribute 'default nil :height 140)
