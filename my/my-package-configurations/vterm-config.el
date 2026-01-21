;;; vterm-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(defun my/vterm-new ()
  "Create a new vterm instance."
  (interactive)
  (vterm (generate-new-buffer-name "vterm")))

(defun my/vterm-toggle-cd ()
  "Toggle vterm and cd to the current directory."
  (interactive)
  (let ((dir (expand-file-name default-directory)))
    (vterm-toggle)
    (when (eq major-mode 'vterm-mode)
      (vterm-send-string (format "cd \"%s\"\n" dir)))))

(use-package vterm
  :ensure t
  :init
  (setq vterm-always-compile-module t)
  (setq vterm-keymap-exceptions '("C-c" "C-x" "C-g" "C-u" "C-h" "M-x" "M-o" "C-y" "M-y"
                                  "M-j" "M-l" "M-h"))
  :config
  (setq vterm-shell "/bin/zsh")
  (setq vterm-timer-delay 0.06))

(use-package vterm-toggle
  :ensure t
  :bind (("M-j c" . vterm-toggle)
         ("M-j C" . my/vterm-toggle-cd)
         ("M-j n" . my/vterm-new))
  :init
  (setq vterm-toggle-scope 'dedicated)
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (setq vterm-toggle-reset-window-configration-after-exit t)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                   (let ((buffer (get-buffer buffer-or-name)))
                     (with-current-buffer buffer
                       (or (equal major-mode 'vterm-mode)
                           (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                 (display-buffer-reuse-window display-buffer-at-bottom)
                 (reusable-frames . visible)
                 (window-height . 0.3))))

(provide 'vterm-config)
;;; vterm-config.el ends here
