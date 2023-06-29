(when (featurep 'shinmera-package)
  (ensure-installed 'glsl-mode)
  (when (featurep 'shinmera-company)
    (ensure-installed 'company-glsl)))

(provide 'shinmera-glsl)

(autoload 'hlsl-mode "hlsl-mode.el" nil t)
(add-to-list 'auto-mode-alist '("\\.fx\\'" . hlsl-mode))
(add-to-list 'auto-mode-alist '("\\.hlsl\\'" . hlsl-mode))
