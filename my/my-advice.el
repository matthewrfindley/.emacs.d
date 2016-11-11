;;; WINDOW SPLITTING
(defun balance-after (&rest args)
  (balance-windows))

(advice-add 'split-window :after 'balance-after)
(advice-add 'delete-window :after 'balance-after)

(provide 'my-advice)
