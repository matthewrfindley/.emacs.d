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

;; Embark - actions on completion candidates
(use-package embark
  :bind (:map vertico-map
         ("C-c C-o" . embark-export)
         ("C-c C-c" . embark-act)
         ("C-c C-e" . my/embark-export-wgrep))
  :preface
  (defvar my/embark-export-wgrep-flag nil)
  (defun my/embark-export-wgrep ()
    "Export and enable wgrep in one step."
    (interactive)
    (setq my/embark-export-wgrep-flag t)
    (command-execute #'embark-export)))

(use-package embark-consult
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode)
  :config
  (declare-function wgrep-change-to-wgrep-mode "ext:wgrep")
  (defun my/embark-export-grep-wgrep (&rest _)
    "Start wgrep after export when flagged."
    (when my/embark-export-wgrep-flag
      (setq my/embark-export-wgrep-flag nil)
      (when (eq major-mode 'grep-mode)
        (wgrep-change-to-wgrep-mode))))
  (advice-add #'embark-consult-export-grep :after #'my/embark-export-grep-wgrep))

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
