(provide 'shinmera-startup)

(defun startup-shinmera ()
  (when window-system
    (ecb-activate)
    (slime))

  (unless (or (server-running-p)
              (eq system-type 'windows-nt))
    (server-start)))

;; Make sure any user changes can be processed before this.
(add-hook 'after-init-hook 'startup-shinmera)
