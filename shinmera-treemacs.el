(require 'shinmera-straight)

(use-package treemacs
  :commands treemacs treemacs-find-file
  :custom (treemacs-width 40)
  :hook (treemacs-mode . (lambda () (display-line-numbers-mode -1))))

(use-package treemacs-projectile
  :after treemacs projectile)

(use-package treemacs-magit
  :after treemacs magit)

(use-package treemacs-all-the-icons
  :after treemacs all-the-icons
  :config (treemacs-load-theme "all-the-icons"))

(provide 'shinmera-treemacs)
