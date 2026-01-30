;;; magit-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package magit
  :ensure t
  :bind (("M-j g" . magit-status)
         ("M-j M-g" . magit-status-from-bookmark))
  :config
  (custom-set-variables
   '(magit-completing-read-function (quote completing-read-default))
   '(magit-save-repository-buffers nil)
   '(magit-branch-read-upstream-first t)
   '(magit-set-upstream-on-push (quote askifnotset)))
  )

(provide 'magit-config)
;;; magit-config.el ends here
