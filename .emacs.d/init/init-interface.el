;;; init-interface.el --- Interface helpers          -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(defalias 'yes-or-no-p 'y-or-n-p)

(use-package which-key
  :diminish which-key-mode
  :init (which-key-mode)
  :config
  (which-key-setup-side-window-bottom)
  (setq which-key-idle-delay 0.2))

(defun ivy--fuzzy-start (str)
  "Match things like in base-Emacs, bash, language-shells, etc. etc."
  (ivy--regex-fuzzy (concat "^" str)))

(use-package ivy
  :diminish
  :bind (("C-x C-f" . counsel-find-file)
         ("C-c k" . counsel-rg)
         ("<f2> i" . counsel-info-lookup-symbol)
         ("<f2> u" . counsel-unicode-char)
         ("<f2> j" . counsel-set-variable)
         ("C-c J" . counsel-file-jump)
         ("M-x" . counsel-M-x)
         :map minibuffer-inactive-mode-map
         ("M-RET" . ivy-immediate-done))
  ;; load eagerly so ivy-rich loads correctly
  :init
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-use-selectable-prompt t
        enable-recursive-minibuffers t)
  (add-to-list 'ivy-ignore-buffers "\\*Compile-Log\\*")
  (add-to-list 'ivy-ignore-buffers "\\*magit-.*")
  (add-to-list 'ivy-ignore-buffers "\\magit-.*")
  (add-to-list 'ivy-ignore-buffers "\\*Flycheck.*")
  (add-to-list 'ivy-ignore-buffers "\\*lsp-.*")
  (with-eval-after-load "projectile"
    (setf projectile-globally-ignored-buffers ivy-ignore-buffers))
  (setq ivy-re-builders-alist '((counsel-find-file . ivy--fuzzy-start)
                                (t . ivy--regex-plus))))

(use-package ivy-prescient
  :after ivy
  :init (ivy-prescient-mode))

(use-package ivy-rich
  :after (ivy counsel)
  :config
  (setq ivy-rich-path-style 'abbrev)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-mode 1))

(use-package counsel
  :after ivy
  :diminish
  :config
  (counsel-mode))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

;; how to use multiple windows
(use-package ace-window
  :config
  (global-set-key (kbd "C-x o") 'ace-window)
  (setq aw-scope 'frame
        aw-keys '(?d ?h ?t ?n ?s ?i ?u ?e ?o ?a)))


(provide 'init-interface)
;;; init-interface.el ends here
