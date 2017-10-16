;;; my-packages --- Summary
;;; Commentary:
;;; Code:

(mapc
 'require
 '(magit-config
   dired-efap-config
   flycheck-config
   smex-config
   wgrep-config
   simp-config
   ido-completing-read+-config
   multiple-cursors-config
   multi-term-config
   my-theme-config
   company-config
   web-mode-config
   sass-mode-config
   move-dup-config
   ruby-test-mode-config
   ))

(provide 'my-package-config)
;;; my-package-config.el ends here
