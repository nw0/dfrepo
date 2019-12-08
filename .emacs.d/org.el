;;;Org mode configuration
(use-package org
  :bind (("C-c a" . org-agenda))
  :hook
  ;; fix the indentation for variable-pitch
  (after-init . (lambda ()
                  (require 'org-indent)
                  (set-face-attribute 'org-indent nil
                                      :inherit '(org-hide fixed-pitch))))
  :config
  (setq org-src-preserve-indentation t
        org-todo-keywords '((sequence "TODO(t)" "BEGUN(s)" "WAIT(w)" "|" "DONE(d)" "DROP(c)"))
        org-startup-folded nil
        org-startup-indented 'f
        org-agenda-files '("~/org"))
  (eval-after-load 'org-indent '(diminish 'org-indent-mode))
  )

(use-package org-bullets
  :ensure t
  :after (org)
  :hook
  (org-mode . org-bullets-mode)
  )
