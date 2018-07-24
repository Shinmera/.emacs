;;;;;;
;; Eiffel things, idk yet
(autoload 'eiffel-mode "eiffel" "Eiffel-Mode" t)

(add-to-list 'auto-mode-alist         '("\\.e\\'" . eiffel-mode))
(add-to-list 'auto-mode-alist         '("\\.ge\\'" . eiffel-mode))

(provide 'shinmera-eiffel)
