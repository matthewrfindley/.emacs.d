;; Before Save  -*- lexical-binding: t; -*-
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Company mode autocompletion
(add-hook 'after-init-hook 'global-company-mode)

(add-hook
 'dired-mode-hook
 (lambda ()
   (define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)
   (define-key dired-mode-map (kbd "e") 'dired-efap)
   (define-key dired-mode-map (kbd "W") 'mf/dired-copy-full-path)))

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(provide 'my-hooks)
