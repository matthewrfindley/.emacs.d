(setq mf-fixed-font "JetBrains Mono NL")
(setq mf-fixed-font-default-size 16)

(setq default-frame-alist
      (append
       (list
        `(font . ,(concat mf-fixed-font "-" (number-to-string mf-fixed-font-default-size)))
        '(min-height . 1) '(height . 45)
        '(min-width . 1) '(width . 81)
        '(vertical-scroll-bars . nil)
        '(internal-border-width . 0)
        '(left-fringe . 16)
        '(right-fringe . 16)
        '(tool-bar-lines . 0)
        '(menu-bar-lines . 0)
        '(undecorated-round . t)
        '(inhibit-double-buffering . t)
        ;; ns-auto-titlebar will take care of this for any other frames and when
        ;; switching to a dark theme, but this is set here to avoid loading
        ;; ns-auto-titlebar on init
        '(ns-transparent-titlebar . t)
        '(ns-appearance . light))
       default-frame-alist))

(setq ns-use-thin-smoothing t
      ns-use-proxy-icon nil)
