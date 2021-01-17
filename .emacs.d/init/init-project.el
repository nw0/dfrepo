;;; init-project.el --- Project management           -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Nicholas Sim
;; Author: Nicholas Sim <nsim@posteo.net>

;;; Commentary:

;;; Code:

(use-package projectile
  :straight t
  :diminish
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "M-p") 'projectile-command-map))

(use-package counsel-projectile
  :straight t
  :after (projectile ivy counsel)
  :config
  (counsel-projectile-mode))

(use-package magit
  :straight t
  :bind ("C-x g" . magit-status)
  :config
  (setq magit-completing-read-function 'ivy-completing-read))

(use-package flycheck
  :straight t)

(use-package flyspell
  :straight t
  :diminish
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode))
  :config
  (setq flyspell-issue-message-flag nil))


(provide 'init-project)
;;; init-project.el ends here
