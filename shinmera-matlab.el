(provide 'shinmera-matlab)

(when (featurep 'shinmera-package)
  (ensure-installed 'matlab-mode))

;;;;;;
;; Autoloads
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")
