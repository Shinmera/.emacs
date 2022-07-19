(when (featurep 'shinmera-package)
  (ensure-installed 'perspective))

(require 'perspective)

(global-set-key (kbd "C-x C-b") 'persp-list-buffers)
(customize-set-variable 'persp-mode-prefix-key (kbd "C-c M-p"))
(persp-mode)

(provide 'shinmera-perspective)
