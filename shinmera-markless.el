(require 'shinmera-straight)

(use-package markless
  :commands (markless-mode)
  :mode
  ("\\.mess\\'" . markless-mode)
  ("\\.markless\\'" . markless-mode)
  :hook (markless-mode . olivetti-mode))

(provide 'shinmera-markless)
