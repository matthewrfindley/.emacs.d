;;; no-littering-config --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;; Keep .emacs.d clean by redirecting package files to etc/ and var/
;;; Code:

;; Hash long filenames for auto-save and backup
(defun my/make-auto-save-file-name-hashed (fn)
  "Compress the auto-save file name so paths don't get too long."
  (let ((buffer-file-name
         (if (or (null buffer-file-name)
                 (find-file-name-handler buffer-file-name 'make-auto-save-file-name))
             buffer-file-name
           (sha1 buffer-file-name))))
    (funcall fn)))

(defun my/make-backup-file-name-hashed (fn file)
  "A few places use the backup file name so paths don't get too long."
  (let ((alist backup-directory-alist)
        backup-directory)
    (while alist
      (let ((elt (car alist)))
        (if (string-match (car elt) file)
            (setq backup-directory (cdr elt) alist nil)
          (setq alist (cdr alist)))))
    (let ((file (funcall fn file)))
      (if (or (null backup-directory)
              (not (file-name-absolute-p backup-directory)))
          file
        (expand-file-name (sha1 (file-name-nondirectory file))
                          (file-name-directory file))))))

(use-package no-littering
  :ensure t
  :config
  (setq backup-directory-alist
        `(("." . ,(no-littering-expand-var-file-name "backup/"))))
  (setq auto-save-list-file-prefix
        (no-littering-expand-var-file-name "auto-save/sessions/"))
  (setq auto-save-file-name-transforms
        `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

  (advice-add #'make-auto-save-file-name :around #'my/make-auto-save-file-name-hashed)
  (advice-add #'make-backup-file-name-1 :around #'my/make-backup-file-name-hashed))

(provide 'no-littering-config)
;;; no-littering-config.el ends here
