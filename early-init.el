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
        '(tool-bar-lines . 0)
        '(menu-bar-lines . 0)
        '(inhibit-double-buffering . t)
        '(ns-transparent-titlebar . t)
        '(ns-appearance . dark))
       default-frame-alist))

(setq ns-use-thin-smoothing t
      ns-use-proxy-icon nil)
