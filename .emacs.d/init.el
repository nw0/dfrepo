;;; init.el --- New init                             -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

;; adjust gc thresholds to start up faster
(let ((normal-gc-cons-threshold (* 512 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024))
      (normal-gc-cons-percentage 0.2)
      (init-gc-cons-percentage 10.0))

  (setq gc-cons-threshold init-gc-cons-threshold
        gc-cons-percentage init-gc-cons-percentage
        read-process-output-max (* 1024 1024))
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold
                        gc-cons-percentage normal-gc-cons-percentage
                        jit-lock-stealth-time 1
                        ;; jit-lock-stealth-load 200
                        jit-lock-chunk-size 1000
                        jit-lock-defer-time 0.05
                        inhibit-compacting-font-caches t))))

(setq user-full-name "Nicholas Sim")
(setq user-mail-address "nsim@posteo.net")

(add-to-list 'load-path (expand-file-name "init" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-util)
(require 'init-pkg)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(require 'init-cleanup)
(require 'init-theme)
(require 'init-editor)
(require 'init-visual)
(require 'init-interface)

;; Projectile, dired, magit, Fly*
(require 'init-project)

;; Programming modes
(require 'init-lsp)
(require 'init-elisp)
(require 'init-rust)
(require 'init-python)
(require 'init-markup)


(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

;; modes -- all the modes
;; org mode, org roam
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 135
                    :weight 'normal
                    :width 'normal)

(use-package pangu-spacing
  :straight t
  :diminish
  :config
  (global-pangu-spacing-mode 1))

(use-package irony
  :straight t)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map
      [remap completion-at-point] 'counsel-irony)
  (define-key irony-mode-map
      [remap complete-symbol] 'counsel-irony))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(add-hook 'java-mode-hook (lambda()
                            (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode t)))

(use-package ledger-mode
  :straight t
  :hook (ledger-mode . (lambda () (mixed-pitch-mode -1))))

(use-package elfeed
  :straight t
  :bind ("C-x w" . 'elfeed)
  :config
  (add-to-list 'evil-motion-state-modes 'elfeed-search-mode)
  (add-to-list 'evil-motion-state-modes 'elfeed-show-mode)
  (evil-define-key* 'motion elfeed-search-mode-map
                    "gb" #'elfeed-search-browse-url
                    "gr" #'elfeed-search-update--force
                    "gR" #'elfeed-search-fetch)
  (evil-define-key* 'motion elfeed-show-mode-map
                    "gb" #'elfeed-show-visit
                    "gj" #'elfeed-show-next
                    "gk" #'elfeed-show-prev))
(setq elfeed-show-mode-hook
      (lambda ()
        (set-face-attribute 'variable-pitch (selected-frame) :font (font-spec :family "Nimbus Sans" :size 24 :height 300))
        (setq fill-column 90)
        (setq line-spacing 0.3)
        (setq show-trailing-whitespace nil)))

(use-package elfeed-org
  :straight t
  :after (elfeed org)
  :config
  (with-eval-after-load 'org
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/org/feeds.org"))
  (org-reload)))

;; split pane
(use-package elfeed-goodies
  :straight t
  :after (elfeed)
  :config (elfeed-goodies/setup))

(defun elfeed-mark-all-as-read ()
  (interactive)
  (mark-whole-buffer)
  (elfeed-search-untag-all-unread))
(define-key elfeed-search-mode-map (kbd "R") 'elfeed-mark-all-as-read)

(use-package explain-pause-mode
  :straight (explain-pause-mode :type git :host github :repo "lastquestion/explain-pause-mode")
  :diminish
  :config
  (explain-pause-mode))


(use-package org
  :bind (:map org-mode-map
              ("C-c a" . org-agenda))
  :config
  (setq org-src-preserve-indentation t
        org-todo-keywords '((sequence "TODO(t)" "BEGUN(s)" "WAIT(w)" "|" "DONE(d)" "DROP(c)"))
        org-startup-folded nil
        org-startup-indented 'f
        org-src-tab-acts-natively t
        org-log-done t
        org-agenda-span 17
        org-agenda-start-on-weekday nil
        org-agenda-start-day "-3d"
        org-agenda-files '("~/org"))
  (eval-after-load 'org-indent '(diminish 'org-indent-mode))
  (setq org-latex-pdf-process (list "latexmk -f -pdf %f"))
  (require 'org-indent)
  )


(defun org-agenda-force-refresh ()
  (interactive)
  (when (get-buffer "*Org Agenda*")
    (with-current-buffer "*Org Agenda*"
      (org-agenda-maybe-redo)
      (message "[org agenda] refreshed!"))))
(global-set-key (kbd "C-c r") 'org-agenda-force-refresh)

(use-package org-roam
  :straight t
  :diminish
  :hook
  (after-init . org-roam-mode)
  :custom
  (org-roam-directory "~/org/roam")
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n j" . org-roam-jump-to-index)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert)))
  :config
  (setq org-roam-capture-templates
        `(("d" "default" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d>-${slug}"
           :head "#+TITLE: ${title}\n\n- tags ::"
           :unnarrowed t)
          ("h" "person" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d>-${slug}"
           :head "#+TITLE: ${title}\n\n- affiliation ::")
          ("p" "resource" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d>-${slug}"
           :head ,(concat
                   "#+TITLE: ${title}\n\n"
                   "- tags :: \n"
                   "- citation :: \n"
                   "- date read: %(format-time-string \"%Y-%m-%d\")\n\n"
                   "# Note: NO CLASSIFIED MATERIAL\n\n"
                   "* Relevance\n"
                   "# Why now?\n"
                   "# Why is this interesting?\n"
                   "# Before reading: why did you select this paper?\n"
                   "\n"
                   "* Objectively, what are the contributions of this work?\n"
                   "\n"
                   "* Problem\n"
                   "# What is the problem?\n"
                   "# Why is it important?\n"
                   "# Does the work improve on prior art?\n"
                   "# Why was this not done previously?\n"
                   "\n"
                   "* The work\n"
                   "# What was done?\n"
                   "# How does it address the problem?\n"
                   "# How is it unique or innovative?\n"
                   "# Give details.\n"
                   "\n"
                   "* Evaluation\n"
                   "# What are the pertinent questions the authors try to address?\n"
                   "# What do the authors say about the system/the work?\n"
                   "# Is the evaluation any good? What are the unaddressed problems and why unaddressed? Limitations?\n"
                   "# Was it presented fairly?\n"
                   "\n"
                   "* Up to 6 pros/cons of the work\n"
                   "# Optional: may not be relevant for this format.\n"
                   "\n"
                   "* Overall opinion\n"
                   "# How do you feel about the work?\n"
                   "# Did it turn out to be relevant?\n"
                   "# Would you utilise the findings of this work?\n"
                   "\n"
                   "* Questions\n"
                   "# At least two questions for the authors.\n"
                   "# Optional if this is not the first reading.\n"
                   "\n"
                   "* Related work\n"
                   "# Do you wish to highlight any related work? Give reasons.")
           :unnarrowed t)
          )))

(use-package company-org-roam
  :straight (:host github :repo "org-roam/company-org-roam")
  :after (company)
  :config
  (push 'company-org-roam company-backends))

(use-package tex
  :hook ((tex-mode . lsp-deferred)
         (latex-mode . lsp-deferred)))

(use-package bibtex
  :hook (bibtex-mode . lsp-deferred))

(use-package lsp-latex
  :straight t)


(provide 'new-init)
;;; init.el ends here
