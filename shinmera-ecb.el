(provide 'shinmera-ecb)
(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'ecb))

;;;;;;
;; Load ECB on demand
(autoload 'ecb-activate "cedet" "Cedet" t)
(autoload 'ecb-activate "ecb" "ECB Environment" t)

(setq
 ecb-tip-of-the-day      nil
 ecb-key-map             '("C-x ."
                           (nil "C-x e" ecb-goto-window-edit-last)
                           (nil "C-x c" ecb-goto-window-compilation)
                           (nil "C-x d" ecb-goto-window-directories)
                           (nil "C-x s" ecb-goto-window-sources))
 ecb-layout-name         "left2"
 ecb-layout-window-sizes '(("left2" (ecb-directories-buffer-name 0.2 . 0.5) (ecb-sources-buffer-name 0.2 . 0.5)))
 ecb-source-file-regexps '((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|fasl\\|class\\|lib\\|dll\\|a\\|so\\|cache\\|out\\|aux\\|log\\|gz\\|pdf\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$")))
 ecb-source-path         '("~/"
                           "~/Projects"
                           "~/Documents"
                           "~/quicklisp/dists/quicklisp/software"
                           "/usr/share/sbcl-source")
 ecb-tree-buffer-style   'ascii-guides)
