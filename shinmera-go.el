(require 'shinmera-straight)

(use-package go-mode
  :commands (go-mode)
  :mode ("\\.go\\'" . go-mode))

(use-package company-go
  :demand t
  :after (go-mode company))

(provide 'shinmera-go)
