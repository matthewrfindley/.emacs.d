;;; web-mode-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package web-mode
  :ensure t
  :mode ("\\.tsx\\'" . web-mode)
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-enable-auto-quoting nil
        web-mode-enable-auto-pairing t)
  ;; Recognize TSX as JSX
  (setq web-mode-content-types-alist '(("jsx" . "\\.tsx\\'"))))

;; --- Tide Setup for TSX inside web-mode (no eslint, no prettier, no flycheck) ---
(defun my/setup-tide-tsx ()
  "Enable Tide only for TSX files using web-mode."
  (when (and (string-equal "tsx" (file-name-extension (or buffer-file-name "")))
             (derived-mode-p 'web-mode))
    (tide-setup)
    (tide-hl-identifier-mode +1) ;; highlight variable under cursor
    (eldoc-mode +1)              ;; show function signatures
    (company-mode +1)))          ;; autocomplete

(use-package tide
  :after (web-mode company)
  :hook ((web-mode . my/setup-tide-tsx)
         (before-save . tide-format-before-save))) ;; remove this line if you don't want formatting


;; (use-package tide
;;   :after (typescript-mode company)
;;   :hook ((typescript-mode . tide-setup)
;;          (typescript-mode . tide-hl-identifier-mode)
;;          (before-save . tide-format-before-save)))

;; (use-package web-mode
;;   :ensure t
;;   :config
;;   (defun my-web-mode-hook ()
;;     (set-node-modules-path)
;;     (company-mode 1)
;;     (tide-mode 1)
;;     (custom-set-variables
;;      ''(local-unset-key (kbd "M-j"))
;;      '(web-mode-content-types-alist
;;        '(("jsx" . "\\.js[x]?\\'")))
;;      '(web-mode-markup-indent-offset 2)
;;      '(web-mode-css-indent-offset 2)
;;      '(web-mode-code-indent-offset 2)
;;      '(web-mode-attr-indent-offset 2)
;;      '(web-mode-attr-value-indent-offset 2)
;;      '(web-mode-indentless-elements 2)
;;      '(web-mode-markup-indent-offset 2)
;;      '(web-mode-sql-indent-offset 2))
;;     )
;;   (add-hook
;;    'web-mode-hook 'my-web-mode-hook)
;;   )


;; TypeScript mode hooks
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (eldoc-mode 1)))

(add-hook 'typescript-tsx-mode-hook
          (lambda ()
            (tide-setup)
            (eldoc-mode 1)))

(provide 'web-mode-config)
;;; web-mode-config.el ends here
