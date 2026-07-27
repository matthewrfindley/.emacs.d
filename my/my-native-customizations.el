;;; my-native-customizations --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(custom-set-variables
 ;; Custom
 '(custom-file "~/.emacs.d/my/my-customize-variables.el")

 '(visible-bell nil)

 ;; No startup screen
 '(inhibit-startup-message t)

 ;; Dont split windows horizontally
 '(split-height-threshold nil)
 '(split-width-threshold 0)

 ;; Indentation: spaces, 2-wide
 '(indent-tabs-mode nil)
 '(tab-width 2)
 '(smie-indent-basic 2)

 '(truncate-lines t)
 '(global-display-line-numbers-mode 1)

 ;; BOOKMARKS
 '(bookmark-default-file "~/.emacs.d/my/my-bookmarks.el")

 ;; Use native image conversion instead of ImageMagick
 '(image-use-external-converter t)
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

;; Disable ImageMagick; use native image support
(setq imagemagick-enabled-types nil)
(add-to-list 'image-type-file-name-regexps '("\\.svg\\'" . svg))

(provide 'my-native-customizations)
;;; my-native-customizations.el ends here
