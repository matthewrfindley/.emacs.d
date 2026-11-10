;;; magit-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :bind (("M-j g" . magit-status)
         ("M-j M-g" . magit-status-from-bookmark)
         :map magit-status-mode-map
         ("#" . c/magit-insert-review-comment))
  :config
  (custom-set-variables
   '(magit-completing-read-function (quote completing-read-default))
   '(magit-save-repository-buffers nil)
   '(magit-branch-read-upstream-first t)
   '(magit-status-show-untracked-files 'all)
   '(magit-set-upstream-on-push (quote askifnotset)))
  )

(provide 'magit-config)
;;; magit-config.el ends here
