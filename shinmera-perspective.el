(require 'shinmera-straight)

(use-package perspective
  :commands persp-list-buffers
  :bind ("C-x C-b" . persp-list-buffers)
  :custom (persp-mode-prefix-key (kbd "C-c M-p"))
  :config (persp-mode))

(provide 'shinmera-perspective)
