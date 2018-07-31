(require 'shinmera-package)
(require 'shinmera-keys)

(when (featurep 'shinmera-package)
  (ensure-installed 'neotree))

(setq neo-smart-open nil)
(setq neo-autorefresh nil)
(setq neo-window-width 40)

;; Don't forget to run (all-the-icons-install-fonts)
(doom-themes-neotree-config)

(add-hook 'neo-after-create-hook (lambda (&optional dummy) (display-line-numbers-mode -1)))

(define-my-key "C-x d" 'neotree-show)
(define-my-key "C-x e" 'neotree-hide)

(provide 'shinmera-neotree)
