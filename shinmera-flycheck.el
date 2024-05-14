(require 'shinmera-straight)

(use-package flycheck
  :hook (c-mode . flycheck-mode))

(use-package flycheck-posframe
  :demand t
  :after (flycheck)
  :hook (flycheck-mode . flycheck-posframe-mode)
  :config
  (flycheck-posframe-configure-pretty-defaults)
  (add-hook 'flycheck-posframe-inhibit-functions #'company--active-p))

(provide 'shinmera-flycheck)
