;; Before Save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Company mode autocompletion
(add-hook 'after-init-hook 'global-company-mode)

(add-hook
 'dired-mode-hook
 (lambda ()
   (define-key dired-mode-map (kbd "<backspace>") 'dired-up-directory)
   (define-key dired-mode-map (kbd "e") 'dired-efap)))

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(provide 'my-hooks)
