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

(use-package company-flow
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'company
    (add-to-list 'company-backends 'company-flow)))

(provide 'company-config)
;;; company-config.el ends here
