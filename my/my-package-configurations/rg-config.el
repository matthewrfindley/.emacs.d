;;; rg-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;; Search and find files using consult + ripgrep/fd
;;; Code:

(defun my/consult-ripgrep-at-point ()
  "Search for thing at point using consult-ripgrep."
  (interactive)
  (consult-ripgrep nil (thing-at-point 'symbol t)))

(use-package consult
  :bind (("M-j s" . consult-ripgrep)
         ("M-j S" . my/consult-ripgrep-at-point)
         ("M-j f" . consult-fd)
         ("M-j d" . dired)
         ("M-j b" . consult-buffer)
         ("M-j B" . ibuffer)))

(provide 'rg-config)

;;; rg-config.el ends here
