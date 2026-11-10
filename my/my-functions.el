;; BUFFERS  -*- lexical-binding: t; -*-

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
  (let* ((root (locate-dominating-file default-directory "node_modules"))
         (node-path (when root (concat root "node_modules/.bin"))))
    (when node-path
      (setq-local exec-path (add-to-list 'exec-path node-path)))))

(defun indent-buffer ()
  "Fix indentation on the entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

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
  (aj/frame-font-size-change (lambda (_x) mf-fixed-font-default-size)))
 (defun presentation-mode ()
    "Increase the font size for presentation."
    (interactive)
    (aj/frame-font-size-change (lambda (x)
                                 (if (eq x 21)
                                     mf-fixed-font-default-size
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

(defun mf/dired-copy-full-path ()
  "Copy the absolute path of the file at point, or of the marked
files, to the kill ring."
  (interactive)
  (dired-copy-filename-as-kill 0))

(defun mf/insert-log-date ()
  "Insert a date in my typical log format.

e.g. Fri Jan 07 2022"
  (interactive)
  (insert (format-time-string "%a %b %-d %Y")))

(defun mf/insert-comment-attribution ()
  "Insert a comment attribution.

e.g. - Matt, Fri Jan 07 2022"
  (interactive)
  (insert "- Matt")
  (save-excursion
    (insert ", ")
    (mf/insert-log-date)))

(defconst mf--log-date-anchor-weekdays
  '("mon" "tue" "wed" "thu" "fri" "sat" "sun"))

(defconst mf--log-date-anchor-months
  '("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec"))

(defun mf/update-log-date-anchor ()
  "Replace a log anchor date on the current line with today's date.

Looks for a date in the lowercase, hyphenated format GitHub uses
for heading anchors, e.g. `tue-aug-18-2026`, and replaces it with
today's date in the same format. Does nothing if the current line
has no such date."
  (interactive)
  (let ((regexp (concat "\\b"
                         (regexp-opt mf--log-date-anchor-weekdays t)
                         "-"
                         (regexp-opt mf--log-date-anchor-months t)
                         "-\\([0-9]\\{1,2\\}\\)-\\([0-9]\\{4\\}\\)"
                         "\\b")))
    (save-excursion
      (beginning-of-line)
      (when (re-search-forward regexp (line-end-position) t)
        (replace-match (downcase (format-time-string "%a-%b-%-d-%Y")) t t)))))

(defun c/magit-goto-worktree-line (file-ident line)
  "Go to worktree LINE in the diff file identified by FILE-IDENT."
  (when-let* ((file-section (magit-get-section file-ident))
              (hunk (cl-find-if
                     (lambda (section)
                       (when-let* ((range (and (magit-hunk-section-p section)
                                              (oref section to-range))))
                         (and (<= (car range) line)
                              (< line (+ (car range) (cadr range))))))
                     (oref file-section children))))
    (goto-char (oref hunk content))
    (let ((current-line (car (oref hunk to-range))))
      (catch 'found
        (while (< (point) (oref hunk end))
          (when (and (= current-line line)
                     (memq (char-after) '(?+ ?\s)))
            (throw 'found t))
          (when (memq (char-after) '(?+ ?\s))
            (setq current-line (1+ current-line)))
          (forward-line))
        nil))))

(defun c/magit-insert-review-comment (comment)
  "Insert COMMENT above the worktree line corresponding to point."
  (interactive (list (read-string "Comment: ")))
  (let* ((window (selected-window))
         (screen-line (count-screen-lines
                       (window-start window) (line-beginning-position)
                       nil window))
         (column (current-column))
         (file-ident (magit-section-ident (magit-diff--file-section)))
         worktree-line)
    (pcase-let ((`(,buffer ,position)
                 (magit-diff-visit-file--noselect t)))
      (with-current-buffer buffer
        (goto-char position)
        (beginning-of-line)
        (insert "### " comment "\n")
        (setq worktree-line (line-number-at-pos))
        (let ((magit-inhibit-refresh t))
          (save-buffer))))
    (magit-refresh)
    (when (c/magit-goto-worktree-line file-ident worktree-line)
      (move-to-column column)
      (set-window-point window (point))
      (set-window-start
       window
       (save-excursion
         (vertical-motion (- screen-line) window)
         (point))
       t))))

  (defvar-local c/magit-expanded-untracked-files nil)

  (defun c/magit-untracked-file-washer (file)
    "Return a washer that inserts diff content for an untracked FILE."
    (lambda ()
      (let ((beg (point)))
        (magit-git-insert "diff" "--no-index" "--no-prefix"
                          "--" "/dev/null" file)
        (save-restriction
          (narrow-to-region beg (point))
          (goto-char beg)
          (when (re-search-forward "^@@" nil t)
            (delete-region beg (match-beginning 0)))
          (goto-char (point-min))
          (magit-wash-sequence #'magit-diff-wash-hunk)))
      (puthash file t (c/magit-expanded-untracked-files))))

  (defun c/magit-expanded-untracked-files ()
    "Return the hash table tracking expanded untracked files."
    (or c/magit-expanded-untracked-files
        (setq c/magit-expanded-untracked-files
              (make-hash-table :test 'equal))))

  (defun c/magit-untracked-file-visibility (section)
    "Set up washer for untracked file sections and restore expansion state."
    (when (and (eq (oref section type) 'file)
               (when-let* ((parent (oref section parent)))
                 (eq (oref parent type) 'untracked)))
      (oset section washer
            (c/magit-untracked-file-washer (oref section value)))
      (if (gethash (oref section value) (c/magit-expanded-untracked-files))
          'show
        'hide)))

  (add-hook 'magit-section-set-visibility-hook
            #'c/magit-untracked-file-visibility)

  (defun c/magit-set-untracked-file-content-marker ()
    "Set content marker so the visibility indicator appears."
    (let ((section magit-insert-section--current))
      (when (and (eq (oref section type) 'file)
                 (oref section washer)
                 (not (oref section content))
                 (when-let* ((parent (oref section parent)))
                   (eq (oref parent type) 'untracked)))
        (oset section content (point-marker)))))

  (add-hook 'magit-insert-section-hook
            #'c/magit-set-untracked-file-content-marker)

  (define-advice magit-section-hide (:before (section) c/track-untracked-collapse)
    "Track when an untracked file section is collapsed."
    (when (and (eq (oref section type) 'file)
               (oref section content)
               (when-let* ((parent (oref section parent)))
                 (eq (oref parent type) 'untracked)))
      (remhash (oref section value) (c/magit-expanded-untracked-files))))

  (define-advice magit-stage-untracked (:around (fn &rest args) c/handle-hunk)
    "Handle staging from a hunk section under an untracked file."
    (if (eq (oref (magit-current-section) type) 'hunk)
        (let ((file (oref (oref (magit-current-section) parent) value)))
          (magit-run-git "add" "--" file))
      (apply fn args)))


(defun matthew/image-mode-light-background ()
    "Composite transparent images against white in `image-mode' buffers."
    (let ((image (image-get-display-property)))
      (when image
        (setf (image-property image :background) "white")
        (force-window-update (selected-window)))))

  (add-hook 'image-mode-hook #'matthew/image-mode-light-background)

(provide 'my-functions)
