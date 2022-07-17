(require 'shinmera-package)
(require 'shinmera-keys)

(when (featurep 'shinmera-package)
  (ensure-installed 'rtags 'rtags-xref 'irony 'company-irony 'company-c-headers
                    'cmake-ide 'cmake-mode 'realgud-lldb))

(require 'rtags)
(require 'rtags-xref)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'rtags-xref-enable)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(when (featurep 'shinmera-company)
  (add-hook 'c-mode-hook #'company-mode)
  (add-hook 'c++-mode-hook #'company-mode)
  (add-hook 'objc-mode-hook #'company-mode)
  (add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-irony-c-headers))

(provide 'shinmera-c)
