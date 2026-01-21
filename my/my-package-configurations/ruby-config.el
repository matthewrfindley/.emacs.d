;;; ruby-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;; Ruby-mode customizations (separate from ruby-test-mode)
;;; Code:

(defcustom ruby-bracketed-args-indent t
  "Non-nil to align the contents of bracketed arguments with the brackets.
Example:
qux({
     foo => bar
   })
Set it to nil to align to the beginning of the statement:
qux({
  foo => bar
})
Only has effect when `ruby-use-smie' is t."
  :type 'boolean
  :safe 'booleanp
  :version "31.1")

(defun my/ruby-smie-before-paren-advice (orig-fun kind token)
  "Patch for ruby-smie-rules to handle custom bracketed args indentation."
  (if (and (eq kind :before)
           (member token '("(" "[" "{"))
           (not (eq ruby-bracketed-args-indent t))
           (smie-rule-prev-p "," "(" "[")
           (smie-rule-hanging-p))
      (cons 'column (current-indentation))
    (funcall orig-fun kind token)))

(advice-add 'ruby-smie-rules :around #'my/ruby-smie-before-paren-advice)

(setq ruby-bracketed-args-indent nil)

(provide 'ruby-config)
;;; ruby-config.el ends here
