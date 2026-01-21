;;; dired-efap-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package dired
  :ensure nil
  :config
  (setq dired-auto-revert-buffer t))

(use-package dired-efap
  :ensure t
  :config
  (setq dired-efap-initial-filename-selection nil))

(provide 'dired-efap-config)
;;; dired-efap-config.el ends here
