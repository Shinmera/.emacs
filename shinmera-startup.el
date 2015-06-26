(provide 'shinmera-startup)

(when window-system
  (ecb-activate)
  (slime))

(unless (or (server-running-p)
            (eq system-type 'windows-nt))
  (server-start))
