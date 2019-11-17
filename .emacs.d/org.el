;;;Org mode configuration
(use-package org
  :bind (("C-c a" . org-agenda))
  :config
  (setq org-src-preserve-indentation t
        org-todo-keywords '((sequence "TODO(t)" "BEGUN(s)" "WAIT(w)" "|" "DONE(d)" "DROP(c)"))
        org-startup-folded nil
        org-startup-indented 'f
        org-agenda-files '("~/org"))
  (eval-after-load 'org-indent '(diminish 'org-indent-mode)))
