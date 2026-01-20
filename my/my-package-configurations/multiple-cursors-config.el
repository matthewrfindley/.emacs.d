;;; multiple-cursors-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this))
  )

(provide 'multiple-cursors-config)
;;; multiple-cursors-config.el ends here
