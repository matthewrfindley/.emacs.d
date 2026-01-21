;;; speeddating-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package speeddating
  :config
  ;; Tue Nov 2 2021
  (add-to-list 'speeddating-formats "%a %b %-d %Y")
  ;; Tue, 2 Nov 2021
  (add-to-list 'speeddating-formats "%a, %-d %b %Y")
  ;; 2021-11-02 Tue
  (add-to-list 'speeddating-formats "%Y-%m-%d %a"))

(provide 'speeddating-config)
;;; speeddating-config.el ends here
