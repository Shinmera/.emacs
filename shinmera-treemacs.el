(require 'shinmera-package)
(require 'shinmera-keys)

(when (featurep 'shinmera-package)
  (ensure-installed 'treemacs 'treemacs-projectile
                    'treemacs-magit 'treemacs-all-the-icons))

(setq treemacs-width 40)
(add-hook 'treemacs-mode-hook (lambda () (display-line-numbers-mode -1)))

(define-my-key "C-x d" 'treemacs)

(provide 'shinmera-treemacs)
