;;; my-package-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;; Loads all package configurations
;;; Code:

(mapc
 'require
 '(no-littering-config
   vertico-config
   magit-config
   dired-efap-config
   wgrep-config
   rg-config
   multiple-cursors-config
   vterm-config
   my-theme-config
   company-config
   web-mode-config
   sass-mode-config
   move-dup-config
   ruby-config
   ruby-test-mode-config
   markdown-mode-config
   flyspell-config
   rainbow-mode-config
   speeddating-config
   titlecase-config
   yasnippet-config
   ))

(provide 'my-package-config)
;;; my-package-config.el ends here
