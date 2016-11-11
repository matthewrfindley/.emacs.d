;;; simp-config --- Summary
;;; Commentary:
;;; Code:
(use-package simp
  :ensure t
  :bind (("M-j d" . simp-project-root-dired)
         ("M-j s" . simp-project-rgrep)
         ("M-j S" . simp-project-rgrep-thing-at-point)
         ("M-j b" . simp-project-ibuffer-files-only)
         ("M-j B" . simp-project-ibuffer)
         ("M-j f" . simp-project-find-file)
         ("M-j M-f" . simp-project-with-bookmark-find-file)
         ("M-S-p" . simp-project-with-bookmark-find-file)
         ("M-j M-s" . simp-project-with-bookmark-rgrep)
         ("M-j M-b" . simp-project-with-bookmark-ibuffer))
  :config
  (simp-project-define
   '(:type rails
           :has (config.ru app/views app/models app/controllers)
           :ignore (.git, log, public, temp, vendor)))
  (simp-project-define
   '(:type node
           :has (node_modules)
           :ignore (.git log node_modules .bundle vendor)))
  (simp-project-define
   '(:type git
           :has (.git)
           :ignore (.git)))
  (simp-project-define
   '(:type emacs
           :has (init.el)
           :ignore (.git))))

(provide 'simp-config)

;;; simp-config.el ends here
