(require 'shinmera-package)
(require 'shinmera-keys)

(when (featurep 'shinmera-package)
  (ensure-installed 'cmake-mode 'company-c-headers))

(when (featurep 'shinmera-company)
  (add-hook 'c-mode-hook #'company-mode))

(provide 'shinmera-c)
