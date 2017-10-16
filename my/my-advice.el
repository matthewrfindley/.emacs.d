;;; WINDOW SPLITTING
(defun balance-after (&rest args)
  (balance-windows))

(advice-add 'split-window :after 'balance-after)
(advice-add 'delete-window :after 'balance-after)

(with-eval-after-load 'ruby-test-mode
    (advice-add 'ruby-test-run-at-point :before (lambda (&rest r) (save-buffer)))
    (advice-add 'ruby-test-run :before (lambda (&rest r) (save-buffer))))

(provide 'my-advice)
