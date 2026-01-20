;;; rg-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;; rg.el for searching. All commands prompt for directory.
;;; Code:

(defun my/find-file-in-dir (dir)
  "Find file in DIR using fd and completing-read."
  (interactive "DDirectory: ")
  (let* ((default-directory dir)
         (cmd "fd --type f --hidden --exclude .git")
         (files (split-string (shell-command-to-string cmd) "\n" t))
         (file (completing-read "File: " files nil t)))
    (find-file (expand-file-name file dir))))

(defun my/rg-thing-at-point (dir)
  "Search for thing at point in DIR using rg."
  (interactive "DDirectory: ")
  (let ((thing (thing-at-point 'symbol t)))
    (if thing
        (rg thing "*" dir)
      (call-interactively 'rg))))

(use-package rg
  :ensure t
  :bind (("M-j s" . rg)
         ("M-j S" . my/rg-thing-at-point)
         ("M-j f" . my/find-file-in-dir)
         ("M-j d" . dired)
         ("M-j b" . ibuffer)
         ("M-j B" . ibuffer)))

(provide 'rg-config)

;;; rg-config.el ends here
