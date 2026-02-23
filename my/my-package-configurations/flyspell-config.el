;;; flyspell-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package flyspell
  :ensure nil
  :hook ((org-mode git-commit-mode markdown-mode) . flyspell-mode)
  :config
  (setq flyspell-issue-message-flag nil
        flyspell-issue-welcome-flag nil))

(provide 'flyspell-config)
;;; flyspell-config.el ends here
