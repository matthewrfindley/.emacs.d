;;; init.el --- Summary
;;; Commentary:
;;; Code:
(package-initialize)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

(mapc
 'require
 '(my-native-customizations
   my-native-keybindings
   my-packages
   my-functions
   my-theme-customizations
   my-hooks
   my-backups
   my-add-to-lists
   my-advice
   ))

(add-hook 'after-init-hook '(lambda ()
  (mapc
   'require
   '(my-keybindings
     my-mac-support
     ))))
;;; init.el ends here
