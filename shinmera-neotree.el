(provide 'shinmera-neotree)
(require 'shinmera-package)
(require 'shinmera-keys)

(when (featurep 'shinmera-package)
  (ensure-installed 'neotree))

(setq neo-smart-open nil)
(setq neo-theme 'arrow)
(setq neo-window-width 50)

(define-my-key "C-x d" 'neotree-show)
(define-my-key "C-x e" 'neotree-hide)
