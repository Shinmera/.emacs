(require 'shinmera-straight)

(use-package rustic
  :commands (rustic-mode)
  :mode
  ("\\.rs\\'" . rustic-mode))

(provide 'shinmera-rust)
