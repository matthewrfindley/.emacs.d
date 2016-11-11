;;; package -- Summary
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . sass-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))

;; WEB MODE
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(provide 'my-add-to-lists)
;;; my-add-to-lists ends here
