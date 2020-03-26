(require 'shinmera-package)
(require 'shinmera-keys)

(when (featurep 'shinmera-package)
  (ensure-installed 'irony 'company-irony 'company-c-headers
                    'cmake-project 'cmake-mode))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(autoload 'cmake-project-mode "cmake-project" nil t)

(when (featurep 'shinmera-company)
  (add-hook 'c-mode-hook #'company-mode)
  (add-hook 'c++-mode-hook #'company-mode)
  (add-hook 'objc-mode-hook #'company-mode)
  (add-to-list 'company-backends 'company-irony))

(provide 'shinmera-c)
