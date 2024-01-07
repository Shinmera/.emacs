(require 'shinmera-package)
(require 'shinmera-keys)

(when (featurep 'shinmera-package)
  (ensure-installed 'irony 'company-irony 'company-c-headers
                    'cmake-ide 'cmake-mode 'realgud-lldb))

(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(when (featurep 'shinmera-company)
  (add-hook 'c-mode-hook #'company-mode)
  (add-hook 'c++-mode-hook #'company-mode)
  (add-hook 'objc-mode-hook #'company-mode)
  (add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-irony-c-headers))

(defun etags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "find '%s' -type f -regex '.*\.[ch]\(pp\|xx\)?' | etags -" dir-name)))

(provide 'shinmera-c)
