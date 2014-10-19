(provide 'shinmera-uim)

;;;;;;
;; Autoloading and setting.
(autoload 'uim-mode "uim" "Uim-Mode" t)

(eval-after-load "uim"
  '(setq
    uim-default-im-engine "anthy"
    uim-lang-code-alist   (cons '("Japanese" "Japanese" utf-8 "UTF-8")
                                (delete (assoc "Japanese" uim-lang-code-alist) uim-lang-code-alist))))
