;;; my-keybindings --- Summary:
;;; Commentary:
;;; Code:

;; TEXT EDITING
(global-set-key (kbd "M-P") 'move-dup-duplicate-up)
(global-set-key (kbd "M-N") 'move-dup-duplicate-down)
(global-set-key (kbd "C-S-p") 'move-dup-move-lines-up)
(global-set-key (kbd "C-S-n") 'move-dup-move-lines-down)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x j") 'next-error)
(global-set-key (kbd "\'") 'insert-pair)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-+") 'aj/frame-font-size-increase)
(global-set-key (kbd "M--") 'aj/frame-font-size-decrease)

;; (old meta-x)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; BUFFER SWITCHING
(global-set-key (kbd "M-l") 'next-multiframe-window)
(global-set-key (kbd "M-h") 'previous-multiframe-window)
(global-set-key (kbd "C-S-b") 'bury-buffer)
(global-set-key (kbd "C-S-f") 'unbury-buffer)

(global-set-key (kbd "M-x") 'smex)

;; BUFFER Modification
(global-set-key (kbd "C-?") 'revert-buffer)
(global-set-key (kbd "C-,") 'indent-buffer)

(global-set-key (kbd "C-x C-d") 'dired-jump)

(provide 'my-keybindings)
;;; my-keybindings.el ends here
