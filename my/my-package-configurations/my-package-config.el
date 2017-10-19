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
  (when-let ((executable (aj-javascript//locate-npm-executable "eslint_d")))
    (setq-local flycheck-javascript-eslint-executable executable)))

(defun aj-javascript/set-flow-executable ()
  (interactive)
  (let* ((os (pcase system-type
               ('darwin "osx")
               ('gnu/linux "linux64")
               (_ nil)))
         (root (locate-dominating-file  buffer-file-name  "node_modules/flow-bin"))
         (executable (car (file-expand-wildcards
                          (concat root "node_modules/flow-bin/*" os "*/flow")))))
    (setq-local flow-minor-default-binary executable)
    (setq-local company-flow-executable executable)
    (setq-local flycheck-javascript-flow-executable executable)))

(defun aj-javascript/set-prettier-command ()
  (interactive)
  (when-let ((executable (aj-javascript//locate-npm-executable "prettier")))
    (setq-local prettier-js-command executable)))

(defun aj-ruby/rubocop-set-flycheck-executable ()
  (interactive)
  (let* ((dir (locate-dominating-file buffer-file-name "bin/rubocop"))
         (executable (if dir
                         (concat dir "bin/rubocop")
                       (executable-find "rubocop"))))
    (when executable
      (setq-local flycheck-ruby-rubocop-executable executable))))

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

(use-package rubocop
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'ruby-mode-hook #'aj-ruby/rubocop-set-flycheck-executable)
    (add-hook 'enh-ruby-mode-hook #'aj-ruby/rubocop-set-flycheck-executable)
    (add-hook 'ruby-mode-hook #'rubocop-mode)
    (add-hook 'enh-ruby-mode-hook #'rubocop-mode)))

(use-package eslintd-fix
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'web-mode-hook 'eslintd-fix-mode)))

;; eslintd-fix will fix any prettier errors so we don't want to see them in
;; flycheck
(defun aj-javascript//flycheck-eslint-disable-prettier (oldfun checker &rest args)
  (let ((arguments (apply oldfun checker args)))
    (if (eq checker 'javascript-eslint)
        (cons "--rule=prettier/prettier:off" arguments)
      arguments)))

(with-eval-after-load 'flycheck
  (advice-add 'flycheck-checker-substituted-arguments :around
              'aj-javascript//flycheck-eslint-disable-prettier))

(use-package flow-minor-mode
  :defer t
  :ensure t
  :init
  (progn
    (add-hook 'web-mode-hook 'flow-minor-enable-automatically)))

(use-package flycheck-flow
  :ensure t
  :config
  (progn
    (with-eval-after-load 'flycheck
      (flycheck-add-mode 'javascript-flow 'web-mode)
      (flycheck-add-next-checker 'javascript-flow 'javascript-eslint))))

(use-package flycheck-popup-tip
    :ensure t
    :defer t
    :init
    (progn
      (setq flycheck-popup-tip-error-prefix "* ")
      (add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(provide 'my-package-config)
;;; my-package-config.el ends here
