;;; init-elisp.el --- Elisp mode                     -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(setq-default c-basic-offset 2
              tab-width 8)

;; AutoInsert template
(define-auto-insert
  '("\\.el\\'" . "Emacs Lisp header")
  '("Short description: "
    ";;; " (file-name-nondirectory (buffer-file-name)) " --- " str
    (make-string (max 2 (- 80 (current-column) 27)) ?\s)
    "-*- lexical-binding: t; -*-" '(setq lexical-binding t)
    "

;; Copyright (C) " (format-time-string "%Y") "  "
    (getenv "ORGANIZATION") | (progn user-full-name) "
;; Author: " (user-full-name)
    '(if (search-backward "&" (line-beginning-position) t)
         (replace-match (capitalize (user-login-name)) t t))
    '(end-of-line 1) " <" (progn user-mail-address) ">

\;;; Commentary:

\;;; Code:

\;; " _ "


\(provide '"
    (file-name-base (buffer-file-name))
    ")
\;;; " (file-name-nondirectory (buffer-file-name)) " ends here\n"))


(provide 'init-elisp)
;;; init-elisp.el ends here
