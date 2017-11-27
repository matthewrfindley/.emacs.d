;;; company-config --- Summary
;;; Commentary:
;;; Code:
(use-package ruby-test-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'ruby-mode-hook 'ruby-test-mode)
    (add-hook 'enh-ruby-mode-hook 'ruby-test-mode)
    (setq ruby-test-rspec-options '()))
  :config
  (progn
    (advice-add 'ruby-test-run-at-point :before (lambda (&rest r) (save-buffer)))
    (advice-add 'ruby-test-run :before (lambda (&rest r) (save-buffer)))
    ))

(with-eval-after-load 'compile
    ;; hyperlink generic file URI in a compilation buffer
  (add-to-list 'compilation-error-regexp-alist 'generic-file-link)
  (add-to-list 'compilation-error-regexp-alist-alist
                 '(generic-file-link "\\[Screenshot\\]: \\(.*\\)$" 1 2)))
;;    (add-to-list 'compilation-error-regexp-alist-alist '(generic-file-link "file://?\\(\/.*\\)$" 1 2)))

(provide 'ruby-test-mode-config)
;;; ruby-test-mode-config.el ends here
