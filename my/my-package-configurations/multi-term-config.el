;;; multi-term-config --- Summary
;;; Commentary:
;;; Code:
(use-package multi-term
  :ensure t
  :bind (("M-j c" . multi-term))
  :config
  (custom-set-variables
   '(multi-term-program "/bin/zsh"))
  )

(provide 'multi-term-config)
;;; multi-term-config.el ends here
