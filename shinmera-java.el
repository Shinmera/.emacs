(ensure-installed 'jdee)

(autoload 'jdee-mode "jdee" "JDE mode" t)

(setq auto-mode-alist
      (append '(("\\.java\\'" . jdee-mode)) auto-mode-alist))

(provide 'shinmera-java)
