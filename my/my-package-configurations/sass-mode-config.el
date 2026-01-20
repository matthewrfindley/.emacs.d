;;; sass-mode-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package sass-mode
  :ensure t
  :config
  (defun my-sass-mode-hook ()
    ;;;(eslint-set-closest-executable)
    (set-node-modules-path))
  (add-hook
   'sass-mode-hook 'my-sass-mode-hook)
  )

(provide 'sass-mode-config)
;;; sass-mode-config.el ends here
