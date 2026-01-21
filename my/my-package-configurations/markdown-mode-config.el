;;; markdown-mode-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(provide 'markdown-mode-config)
;;; markdown-mode-config.el ends here
