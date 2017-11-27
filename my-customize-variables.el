(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bookmark-default-file "~/.emacs.d/my/my-bookmarks.el")
 '(company-dabbrev-downcase nil)
 '(company-idle-delay 0.1)
 '(custom-file "./my-customize-variables.el")
 '(custom-safe-themes
   (quote
    ("fa6756e5e858f170efd082c599fc348ced3b2283a624efedac9162bcc45eea80" default)))
 '(dired-efap-initial-filename-selection nil)
 '(ido-decorations
   (quote
    ("
>> " "" "
   " "
   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
 '(ido-enable-flex-matching t)
 '(ido-mode t nil (ido))
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-url-at-point t)
 '(ido-use-virtual-buffers t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(magit-branch-read-upstream-first t)
 '(magit-completing-read-function (quote ido-completing-read))
 '(magit-save-repository-buffers nil)
 '(magit-set-upstream-on-push (quote askifnotset))
 '(package-selected-packages
   (quote
    (wgrep web-mode use-package smex simp sass-mode ruby-test-mode rubocop rainbow-mode projectile multiple-cursors multi-term move-dup markdown-preview-mode magit ido-completing-read+ flycheck-popup-tip flycheck-flow flow-minor-mode eslintd-fix dired-efap darcula-theme company-flow)))
 '(quote (local-unset-key (kbd "M-j")))
 '(recentf-save-file (expand-file-name ".recentf" temporary-file-directory))
 '(smex-save-file (expand-file-name ".smex-items" temporary-file-directory))
 '(split-height-threshold nil)
 '(split-width-threshold 0)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-attr-value-indent-offset 2)
 '(web-mode-code-indent-offset 2)
 '(web-mode-content-types-alist (quote (("jsx" . "\\.js[x]?\\'"))) t)
 '(web-mode-css-indent-offset 2)
 '(web-mode-indentless-elements 2 t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(wgrep-auto-save-buffer t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
