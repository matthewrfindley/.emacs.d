;;; my-native-customizations --- Summary
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; Custom
 '(custom-file "~/.emacs.d/my/my-customize-variables.el")

 ;; No startup screen
 '(inhibit-startup-message t)

 ;; Dont split windows horizontally
 '(split-height-threshold nil)
 '(split-width-threshold 0)

 ;; Spaces instead of tabs
 '(indent-tabs-mode nil)

 ;; IDO
 '(ido-mode t)
 '(ido-enable-flex-matching t)
 '(ido-use-virtual-buffers t)
 '(ido-use-filename-at-point (quote guess))
 '(ido-use-url-at-point t)
 '(ido-decorations
   (quote
    ("
>> " "" "
   " "
   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))

 ;; RECENTF
 '(recentf-save-file (expand-file-name ".recentf" temporary-file-directory))

 ;; BOOKMARKS
 '(bookmark-default-file "~/.emacs.d/my/my-bookmarks.el")
 )

;; Remove scrollbars, menu bars, and toolbars
(when (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Highlight lines
(global-hl-line-mode 1)

;; Shorter important prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; Winner mode
(when (fboundp 'winner-mode)
  (winner-mode 1))

(delete-selection-mode 1)
(electric-pair-mode t)

(provide 'my-native-customizations)
;;; my-native-customizations.el ends here
