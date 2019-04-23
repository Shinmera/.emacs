(when (featurep 'shinmera-package)
  (ensure-installed 'glsl-mode)
  (when (featurep 'shinmera-company)
    (ensure-installed 'company-glsl)))

(provide 'shinmera-glsl)
