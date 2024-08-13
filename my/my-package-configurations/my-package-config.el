;;; my-packages --- Summary
;;; Commentary:
;;; Code:

(defun aj-javascript//locate-npm-executable (name)
  (let* ((node-module-path (concat "node_modules/.bin/" name))
         (dir (locate-dominating-file buffer-file-name node-module-path)))
    (if dir
        (concat dir node-module-path)
      (executable-find name))))

(defun aj-javascript/set-prettier-command ()
  (interactive)
  (when-let ((executable (aj-javascript//locate-npm-executable "prettier")))
    (setq-local prettier-js-command executable)))

(mapc
 'require
 '(magit-config
   dired-efap-config
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
   ruby-mode-config
   ))


(use-package prettier
  :hook ((web-mode . prettier-mode)))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :config
  (defun my-markdown-hook ()
    (linum-mode 1)
    (aj-javascript/set-prettier-command)
    (prettier-mode 1)
    )
  (add-hook
   'markdown-mode-hook 'my-markdown-hook)
  :init (setq markdown-command "multimarkdown"))


(use-package rainbow-mode)

 (use-package go-mode
    :mode "\\*\\.go"
    :config
    (add-hook 'before-save-hook 'gofmt-before-save)
    (add-hook 'go-mode-hook
              (lambda ()
                (linum-mode)))
    (use-package go-eldoc
      :config
      (add-hook 'go-mode-hook 'go-eldoc-setup))

    (use-package godoctor)

    (use-package go-guru))


(add-hook
 'typescript-mode-hook
 (lambda ()
   (aj-javascript/set-prettier-command)
   (prettier-mode 1)
   (flycheck-mode 1)
   (tide-setup)
   (eldoc-mode 1)
   ))

(add-hook
 'typescript-tsx-mode-hook
 (lambda ()
   (aj-javascript/set-prettier-command)
   (prettier-js-mode 1)
   (tide-setup)
   (fly-checkmode 1)
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
