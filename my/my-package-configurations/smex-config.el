;;; smex-config --- Summary
;;; Commentary:
;;; Code:
(use-package smex
  :ensure t
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands))
  :config
  (custom-set-variables
   '(smex-save-file (expand-file-name ".smex-items" temporary-file-directory)))
  )

(provide 'smex-config)
;;; smex-config.el ends here
