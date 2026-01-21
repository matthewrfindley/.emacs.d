;;; titlecase-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package titlecase
  :bind (("C-c C-t" . titlecase-dwim))
  :init
  (setq titlecase-style 'ap))

(provide 'titlecase-config)
;;; titlecase-config.el ends here
