;; TEXT EDITING
(global-set-key (kbd "M-P") 'md/duplicate-up)
(global-set-key (kbd "M-N") 'md/duplicate-down)
(global-set-key (kbd "M-p") 'md/move-lines-up)
(global-set-key (kbd "M-n") 'md/move-lines-down)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x j") 'next-error)
(global-set-key (kbd "\'") 'insert-pair)
(global-set-key (kbd "M-z") 'zap-up-to-char)

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

;; MAC OS X SPECIFIC
(when (system-is-mac)
  (require 'my-mac-keybindings))

(provide 'my-keybindings)
