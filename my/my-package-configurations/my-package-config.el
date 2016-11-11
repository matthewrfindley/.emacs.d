;;; my-packages --- Summary
;;; Commentary:
;;; Code:

(mapc
 'require
 '(magit-config
   dired-efap-config
   smex-config
   wgrep-config
   simp-config
   ido-ubiquitous-config
   multiple-cursors-config
   multi-term-config
   my-theme-config
   company-config
   web-mode-config
   flycheck-config
   move-dup-config
   ))

(provide 'my-package-config)
;;; my-package-config.el ends here
