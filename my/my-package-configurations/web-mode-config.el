;;; web-mode-config --- Summary
;;; Commentary:
;;; Code:
;; (use-package tide
;;   :ensure t
;;   :after (typescript-mode company flycheck)
;;   :hook ((aj-javascript/set-prettier-command)
;;          (typescript-mode . tide-setup)
;;          (typescript-mode . tide-hl-identifier-mode)
;;          (before-save . tide-format-before-save)))

(use-package web-mode
  :ensure t
  :config
  (defun my-web-mode-hook ()
    (linum-mode)
    ;;;(aj-javascript/set-eslint-executable)
    (aj-javascript/set-prettier-command)
    (set-node-modules-path)
    ;; (flycheck-add-mode 'typescript-tide 'web-mode)
    (linum-mode)
    (company-mode)
    (tide-mode)
    (prettier-mode)
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

;; (define-derived-mode typescript-tsx-mode web-mode "TypeScript-tsx")
;; (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-tsx-mode))
;; (require 'flycheck)
;; (flycheck-add-next-checker 'typescript-tide '(warning . javascript-eslint) 'append)

;; (add-hook
;;  'typescript-tsx-mode-hook
;;  (lambda ()
;;    (flycheck-add-mode 'typescript-tide 'typescript-tsx-mode)
;;    (tide-setup)
;;    (aj-javascript/set-prettier-command)
;;    (flycheck-mode 1)
;;    (eldoc-mode 1)
;;    ))


(provide 'web-mode-config)
;;; web-mode-config.el ends here
