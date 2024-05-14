(require 'shinmera-straight)

(use-package python-mode
  :commands (python-mode)
  :mode ("\\.py\\'" . python-mode))

(use-package flycheck-pylint
  :demand t
  :after (python-mode flycheck)
  :hook (python-mode . flycheck-mode))

(use-package flycheck-pyflakes
  :demand t
  :after (python-mode flycheck))

(provide 'shinmera-python)
