;;; init-editor.el --- Editor config. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; Text settings

;; Unicode -- these should be default
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8
      coding-system-for-write 'utf-8)

(setq-default tab-width 8
              tab-stop-list '(4 8 12)
              indent-tabs-mode nil)

(setq require-final-newline t)          ; less insanity

(setq delete-old-versions -1            ; delete excess backup versions silently
      version-control t                 ; use version control
      vc-make-backup-files t            ; make backups file even when
                                        ; in version controlled dir
      backup-directory-alist `(("." . "~/.emacs.d/backups"))
      vc-follow-symlinks t              ; don't confirm opening symlinked file
      auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; for the scratch buffer
(setopt initial-major-mode 'fundamental-mode)

(setopt auto-revert-avoid-polling t)
(setopt auto-revert-interval 5)
(setopt auto-revert-check-vc-info t)
(global-auto-revert-mode 1)

;; templates for new files
(auto-insert-mode 1)
(setq auto-insert-alist '())

;; Automatically remove whitespace when saving these files
(use-package ws-butler
  :diminish
  :hook ((prog-mode org-mode) . ws-butler-mode))

;; Don't show trailing whitespace for these modes
(setq-default show-trailing-whitespace t)
(dolist (no-whitespace-hooks '(special-mode-hook
                               term-mode-hook
                               comint-mode-hook
                               compilation-mode-hook
                               eshell-mode-hook
                               minibuffer-setup-hook))
  (add-hook no-whitespace-hooks
            (lambda () (setq show-trailing-whitespace nil))))

(electric-pair-mode 1)              ; auto-insert closing parens, and more


;;; Interaction settings
(global-set-key [remap move-beginning-of-line] #'nw0/beginning-of-line)
;; don't advance to newline at end of buffer
(global-set-key [remap end-of-buffer] #'nw0/end-of-buffer)

(global-set-key (kbd "<home>") 'nw0/beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<select>") 'end-of-line)

(setq scroll-step 1
      scroll-margin 2
      scroll-conservatively 10000)

(use-package evil
  :init
  (setq evil-want-integration t ; the default
        evil-want-keybinding nil
        evil-want-C-i-jump nil)
  :bind (
         :map evil-insert-state-map
         ("C-a" . 'nw0/beginning-of-line)
         ("C-e" . 'end-of-line)
         ("TAB" . 'tab-to-tab-stop)
         ("M-RET" . 'default-indent-new-line)
         :map evil-normal-state-map
         ("C-a" . 'nw0/beginning-of-line)
         ("C-e" . 'end-of-line)
         ("G" . 'my-evil-goto-line)
         :map evil-visual-state-map
         ("C-a" . 'nw0/beginning-of-line)
         ("C-e" . 'end-of-line)
         ("G" . 'my-evil-goto-line))
  :config
  (evil-define-motion my-evil-goto-line (count)
    "Go to the first non-blank character of line COUNT.
By default the last line."
    :jump t
    :type line
    (if (null count)
        (with-no-warnings (nw0/end-of-buffer))
      (goto-char (point-min))
      (forward-line (1- count)))
    (evil-first-non-blank))

  (evil-mode 1))

(use-package evil-collection
  :after evil
  :diminish evil-collection-unimpaired-mode
  :config
  (evil-collection-init))

(use-package smart-hungry-delete
  :bind (("C-<backspace>" . smart-hungry-delete-backward-char)
         ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks))

;;; Completion and insertion
(use-package emacs
  :config
  ;; Hide M-x commands not in current mode
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; tab-cycle completions
  (completion-cycle-threshold 5)
  ;; allow tab-completion
  (tab-always-indent 'complete))

(use-package vertico
  :custom
  ;; (vertico-scroll-margin 0) ;; Different scroll margin
  ;; (vertico-count 20) ;; Show more candidates
  ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
  ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
  :init
  (vertico-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :custom
  (completion-styles '(tab orderless basic)
  (completion-category-overrides '((file (styles basic partial-completion))))))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-quit-no-match 'separator)
  (corfu-preselect 'directory)
  :init
  (global-corfu-mode)
  :config
  (add-to-list 'completion-styles-alist
             '(tab completion-basic-try-completion ignore
               "Completion style which provides TAB completion only.")))

(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)

(global-set-key (kbd "C-S-v") 'clipboard-yank)

; (use-package company
;   :diminish company-mode
;   :hook (after-init . global-company-mode)
;   :custom
;   (global-company-mode 1)
;   (company-idle-delay .4))


(provide 'init-editor)
;;; init-editor.el ends here
