(require 'shinmera-straight)

(use-package python-mode
  :commands (python-mode)
  :mode ("\\.py\\'" . python-mode))

(use-package flycheck-pyflakes
  :demand t
  :after (python-mode flycheck)
  :hook (python-mode . flycheck-mode))

(provide 'shinmera-python)
