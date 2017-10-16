;;; my-packages --- Summary
;;; Commentary:
;;; Code:

(defun aj-javascript//locate-npm-executable (name)
  (let* ((node-module-path (concat "node_modules/.bin/" name))
         (dir (locate-dominating-file buffer-file-name node-module-path)))
    (if dir
        (concat dir node-module-path)
      (executable-find name))))

(defun aj-javascript/set-eslint-executable ()
  (interactive)
  (when-let* ((executable (aj-javascript//locate-npm-executable "eslint_d")))
    (setq-local flycheck-javascript-eslint-executable executable)))

(defun aj-javascript/set-flow-executable ()
  (interactive)
  (when-let* ((executable (aj-javascript//locate-npm-executable "flow")))
    (setq-local flow-minor-default-binary executable)
    (setq-local company-flow-executable executable)
    (setq-local flycheck-javascript-flow-executable executable)))

(defun aj-javascript/set-prettier-command ()
  (interactive)
  (when-let* ((executable (aj-javascript//locate-npm-executable "prettier")))
    (setq-local prettier-js-command executable)))

(mapc
 'require
 '(magit-config
   dired-efap-config
   flycheck-config
   smex-config
   wgrep-config
   simp-config
   ido-completing-read+-config
   multiple-cursors-config
   multi-term-config
   my-theme-config
   company-config
   web-mode-config
   sass-mode-config
   move-dup-config
   ruby-test-mode-config
   ))

(provide 'my-package-config)
;;; my-package-config.el ends here
