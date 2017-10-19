;;; ido-completing-read+-config --- Summary
;;; Commentary:
;;; Code:
(use-package ido-completing-read+
  :ensure t
  :config
  (progn
   (ido-mode 1)
   (ido-everywhere 1)
   (ido-ubiquitous-mode 1))
  )

(provide 'ido-completing-read+-config)
;;; ido-completing-read+-config.el ends here
