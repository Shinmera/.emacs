(when (featurep 'shinmera-package)
  (ensure-installed 'flycheck-pylint 'python-mode))

(require 'flycheck)
(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)

(provide 'shinmera-python)
