;;; vterm-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(defun my/vterm-new ()
  "Create a new vterm instance."
  (interactive)
  (vterm (generate-new-buffer-name "vterm")))

(use-package vterm
  :ensure t
  :bind (("M-j c" . vterm)
         ("M-j C" . my/vterm-new))
  :init
  (setq vterm-keymap-exceptions '("C-c" "C-x" "C-g" "C-u" "C-h" "M-x" "M-o" "C-y" "M-y"
                                  "M-j" "M-l" "M-h"))
  :config
  (setq vterm-shell "/bin/zsh"))

(provide 'vterm-config)
;;; vterm-config.el ends here
