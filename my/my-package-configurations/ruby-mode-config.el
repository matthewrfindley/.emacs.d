(use-package enh-ruby-mode
  :ensure t
  :config
  (defun my-ruby-mode-hook ()
    (enh-ruby-add-encoding-comment-on-save nil))
  (add-hook
   'enh-ruby-mode-hook 'my-ruby-mode-hook
   )
   ;;  (add-hook
   ;; 'ruby-mode-hook #'rubocopfmt-mode
   ;; )
    )

(provide 'ruby-mode-config)
