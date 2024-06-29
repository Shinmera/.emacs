(require 'shinmera-straight)

(use-package rustic
  :commands (rustic-mode)
  :mode
  ("\\.rs\\'" . rustic-mode))

(use-package lsp-mode
  :demand t
  :after (rustic))

(provide 'shinmera-rust)
