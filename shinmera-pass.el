(when (featurep 'shinmera-package)
  (ensure-installed 'pass))

(require 'auth-source-pass)
(auth-source-pass-enable)

(provide 'shinmera-pass)
