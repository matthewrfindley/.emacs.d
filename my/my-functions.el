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

(setq aj-fixed-font-default-size 14)
(defun aj/frame-font-size-increase ()
  "Increase the font size of the entire frame."
  (interactive)
  (aj/frame-font-size-change '1+))
(defun aj/frame-font-size-decrease ()
  "Decrease the font size of the entire frame."
  (interactive)
  (aj/frame-font-size-change '1-))
(defun aj/frame-font-size-reset ()
  "Decrease the font size of the entire frame."
  (interactive)
  (aj/frame-font-size-change (lambda (_x) aj-fixed-font-default-size)))
 (defun presentation-mode ()
    "Increase the font size for presentation."
    (interactive)
    (aj/frame-font-size-change (lambda (x)
                                 (if (eq x 21)
                                     aj-fixed-font-default-size
                                   21))))
  (defun aj/frame-font-size-change (fn)
    "Change the font size of the frame."
    (let* ((current-font-name (frame-parameter nil 'font))
           (decomposed-font-name (x-decompose-font-name current-font-name))
           (font-size (string-to-number (aref decomposed-font-name 5))))
      (aset decomposed-font-name 5 (int-to-string (funcall fn font-size)))
      (set-frame-font (x-compose-font-name decomposed-font-name))))


(defun aj/xml-format ()
  "Format XML using xmllint"
  (interactive)
  (shell-command-on-region (point-min) (point-max) "xmllint --format -" t t "*xmllint error*" t))

(defun aj/rename-current-file (newname)
    "Rename file visited by current buffer to NEWNAME.
Interactively, prompt the user for the target filename, with
completion.
If NEWNAME is a directory then extend it with the basename of
`buffer-file-name'. Make parent directories automatically."
    (interactive
     (progn
       (unless buffer-file-name
         (user-error "Current buffer is not visiting a file"))
       (let ((newname (read-file-name "Rename to: " nil buffer-file-name)))
         (when (equal (file-truename newname)
                      (file-truename buffer-file-name))
           (user-error "%s" "Can't rename a file to itself"))
         (list newname))))
    (unless buffer-file-name
      (error "Current buffer is not visiting a file"))
    (when (equal (file-truename newname)
                 (file-truename buffer-file-name))
      (error "%s: %s" "Can't rename a file to itself" newname))
    (when (equal newname (file-name-as-directory newname))
      (setq newname
            (concat newname (file-name-nondirectory buffer-file-name))))
    (make-directory (file-name-directory newname) 'parents)
    ;; Passing integer as OK-IF-ALREADY-EXISTS means prompt for
    ;; confirmation before overwriting. Why? Who can say...
    (dired-rename-file buffer-file-name newname 0))

(provide 'my-functions)
