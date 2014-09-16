(provide 'shinmera-init)

;;;;;;
;; Load proper translation of characters.
(load-library "iso-transl")

;;;;;;
;; Set up loading-paths
(add-to-list 'load-path              "~/.emacs.d/extrapkg/")
(add-to-list 'load-path              "~/.emacs.d/shinmera/")
(add-to-list 'load-path              "~/quicklisp")
