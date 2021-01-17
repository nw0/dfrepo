;;; init-util.el --- Define utility functions. -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun nw0/beginning-of-line ()
  "Move point to 'beginning-of-line' or first non-whitespace character or first non-whitespace after a comment sign."
  (interactive "^")
  (let (
        (oldpos (point))
        (indentpos (progn
                     (back-to-indentation)
                     (point)
                     )
                   )
        (textpos (progn
                   (beginning-of-line-text)
                   (point)
                   )
                 )
        )
    (cond
     ((> oldpos textpos) (beginning-of-line)) ; OP <= tpos
     ((= oldpos (line-beginning-position)) (beginning-of-line-text)) ; 0 < OP <= tpos
     ((> oldpos indentpos) (back-to-indentation)) ; 0 < OP <= ipos
     (t (beginning-of-line))
     )))

(defun nw0/end-of-buffer ()
  "Go to beginning of last line in buffer.
If last line is empty, go to beginning of penultimate one
instead."
  (interactive)
  (goto-char (point-max))
  (beginning-of-line (and (looking-at-p "^$") 0)))

(provide 'init-util)
;;; init-util.el ends here
