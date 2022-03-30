;;; sass-mode-config --- Summary
;;; Commentary:
;;; Code:
(use-package sass-mode
  :ensure t
  :config
  (defun my-sass-mode-hook ()
    (linum-mode)
    ;;;(eslint-set-closest-executable)
    (set-node-modules-path)
    (flycheck-mode))
  (add-hook
   'sass-mode-hook 'my-sass-mode-hook)
  )

(provide 'sass-mode-config)
;;; sass-mode-config.el ends here
