;;; company-config --- Summary
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :config
  (custom-set-variables
   '(company-idle-delay 0.1)
   '(company-dabbrev-downcase nil))
  )

(provide 'company-config)
;;; company-config.el ends here
