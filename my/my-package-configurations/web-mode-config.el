;;; web-mode-config --- Summary
;;; Commentary:
;;; Code:
(use-package web-mode
  :ensure t
  :config
  (defun my-web-mode-hook ()
    (linum-mode)
    (eslint-set-closest-executable)
    (set-node-modules-path)
    (flycheck-mode)
    (custom-set-variables
     ''(local-unset-key (kbd "M-j"))
     '(web-mode-content-types-alist
       '(("jsx" . "\\.js[x]?\\'")))
     '(web-mode-markup-indent-offset 2)
     '(web-mode-css-indent-offset 2)
     '(web-mode-code-indent-offset 2)
     '(web-mode-attr-indent-offset 2)
     '(web-mode-attr-value-indent-offset 2)
     '(web-mode-indentless-elements 2)
     '(web-mode-markup-indent-offset 2)
     '(web-mode-sql-indent-offset 2))
    )
  (add-hook
   'web-mode-hook 'my-web-mode-hook)
  )

(provide 'web-mode-config)
;;; web-mode-config.el ends here
