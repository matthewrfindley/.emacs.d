;;; vertico-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;; Vertico + orderless + consult + marginalia completion stack
;;; Code:

;; Vertico - vertical completion UI
(use-package vertico
  :init
  (vertico-mode))

;; Orderless - flexible matching (fuzzy, flex, etc.)
(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Marginalia - rich annotations in minibuffer
(use-package marginalia
  :init
  (marginalia-mode))

;; Consult - enhanced commands
(use-package consult
  :bind (("M-x" . execute-extended-command)
         ("C-x b" . consult-buffer)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-s l" . consult-line)
         ("M-s r" . consult-ripgrep)))

(provide 'vertico-config)
;;; vertico-config.el ends here
