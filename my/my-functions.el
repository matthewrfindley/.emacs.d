;; BUFFERS

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; TEXT MANIPULATION
(defun duplicate-current-line-or-region-down (arg)
  (interactive "p")
  (duplicate-current-line-or-region arg))

(defun duplicate-current-line-or-region-up (arg)
  (interactive "p")
  (duplicate-current-line-or-region arg))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

;; BOOKMARKS
;; Some functions borrowed from https://github.com/re5et/.emacs.d ;)
(defmacro with-directory-from-bookmark (&rest body)
  "Run BODY with default-directory set to
to the location of the selected bookmark."
  `(let ((bookmark
          (list
           (bookmark-completing-read
            "bookmark"
            bookmark-current-bookmark))))
     (let ((default-directory
             (file-name-directory
              (expand-file-name
               (bookmark-location
                (car bookmark))))))
       ,@body)))

;; MAGIT
(defun magit-status-from-bookmark ()
  "Magit status for bookmark"
  (interactive)
  (with-directory-from-bookmark
   ;; magit does some pretty funny stuff invovling buffers
   ;; and default-directory, the below works around it.
   (magit-status default-directory)))

;; SYSTEM
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))

;; TABS
(defun untabify-all ()
  (interactive)
  (untabify (point-min) (point-max)))


;; SYSTEM
(defun set-node-modules-path ()
  "Adds node_modules to the end of exec-path, so emacs
   can use commands found in local node_modules/.bin"
  (let ((node-path (concat (simp-project-root) "/node_modules/.bin")))
    (setq-local exec-path (add-to-list 'exec-path node-path))))

;; ESLINT
(defun eslint-set-closest-executable (&optional dir)
  (interactive)
  (let* ((dir (or dir default-directory))
         (eslint-executable (concat dir "/node_modules/.bin/eslint")))
    (if (file-exists-p eslint-executable)
        (progn
          (make-variable-buffer-local 'flycheck-javascript-eslint-executable)
          (setq flycheck-javascript-eslint-executable eslint-executable))
      (if (string= dir "/") nil
        (eslint-set-closest-executable (expand-file-name ".." dir))))))

(defun indent-buffer ()
  "Fix indentation on the entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

  (defun jc/go-guru-set-current-package-as-main ()
    "GoGuru requires the scope to be set to a go package which
     contains a main, this function will make the current package the
     active go guru scope, assuming it contains a main"
    (interactive)
    (let* ((filename (buffer-file-name))
           (gopath-src-path (concat (file-name-as-directory (go-guess-gopath)) "src"))
           (relative-package-path (directory-file-name (file-name-directory (file-relative-name filename gopath-src-path)))))
      (setq go-guru-scope relative-package-path)))

(provide 'my-functions)
