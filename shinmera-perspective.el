(when (featurep 'shinmera-package)
  (ensure-installed 'perspective))

(require 'perspective)

(persp-mode)

(provide 'shinmera-perspective)
