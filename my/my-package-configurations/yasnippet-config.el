;;; yasnippet-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-global-mode 1))

(provide 'yasnippet-config)
;;; yasnippet-config.el ends here
