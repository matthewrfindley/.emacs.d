(when (system-is-mac)
  ;; Set command key to be meta instead of option
  (setq ns-command-modifier 'meta)

  ;; Full screen window without OSX native full screen UI
  (defun fast-fullscreen-2560 ()
    "Position the frame above the visible screen rectangle,
auto hide the toolbar, and take up the whole screen."
    (interactive)
    (setq ns-auto-hide-menu-bar t)
    (set-frame-position nil 0 -24)
    (tool-bar-mode 0)
    (set-frame-size nil 363 103))
  )


(provide 'my-mac-support)
