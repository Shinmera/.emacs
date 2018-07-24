(ensure-installed 'jdee)

(autoload 'jde-mode "jde" "JDE mode" t)

(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

(provide 'shinmera-java)
