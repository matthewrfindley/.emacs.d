;;; flycheck-config --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint json-jsonlist)))
  (with-eval-after-load 'flycheck
    (flycheck-add-mode 'javascript-eslint 'web-mode)))

(provide 'flycheck-config)
;;; flycheck-config.el ends here
