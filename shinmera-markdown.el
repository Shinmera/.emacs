(require 'shinmera-straight)

(use-package markdown-mode
  :commands (markdown-mode)
  :mode
  ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode))

(provide 'shinmera-markdown)
