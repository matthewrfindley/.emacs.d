;;; my-packages --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defun aj-javascript//locate-npm-executable (name)
  (let* ((node-module-path (concat "node_modules/.bin/" name))
         (dir (locate-dominating-file buffer-file-name node-module-path)))
    (if dir
        (concat dir node-module-path)
      (executable-find name))))

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

(defun aj-ruby-smie-before-paren-advice (orig-fun kind token)
  "Patch for ruby-smie-rules to handle custom bracketed args indentation."
  (if (and (eq kind :before)
           (member token '("(" "[" "{"))
           (not (eq ruby-bracketed-args-indent t))
           (smie-rule-prev-p "," "(" "[")
           (smie-rule-hanging-p))
      (cons 'column (current-indentation))
    (funcall orig-fun kind token)))

(advice-add 'ruby-smie-rules :around #'aj-ruby-smie-before-paren-advice)

(setq ruby-bracketed-args-indent nil)

(mapc
 'require
 '(no-littering-config
   magit-config
   dired-efap-config
   smex-config
   wgrep-config
   rg-config
   ido-completing-read+-config
   multiple-cursors-config
   vterm-config
   my-theme-config
   company-config
   web-mode-config
   sass-mode-config
   move-dup-config
   ruby-test-mode-config
   ))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
  (defun my-markdown-hook ()
    (linum-mode 1)
    ))

(use-package rainbow-mode)

(add-hook
 'typescript-mode-hook
 (lambda ()
   (tide-setup)
   (eldoc-mode 1)
   ))

(add-hook
 'typescript-tsx-mode-hook
 (lambda ()
   (tide-setup)
   (eldoc-mode 1)
   ))

(use-package speeddating
  :config
  ;; Tue Nov 2 2021
  (add-to-list 'speeddating-formats "%a %b %-d %Y")

  ;; Tue, 2 Nov 2021
  (add-to-list 'speeddating-formats "%a, %-d %b %Y")

  ;; 2021-11-02 Tue
  (add-to-list 'speeddating-formats "%Y-%m-%d %a"))

(use-package titlecase
  :bind (("C-c C-t" . titlecase-dwim))

  :init
  (setq titlecase-style 'ap))

(provide 'my-package-config)
;;; my-package-config.el ends here
