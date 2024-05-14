(require 'shinmera-straight)

(use-package company
  :defer 0.5
  :bind (:map company-active-map
              ("<up>" . company-select-previous)
              ("<down>" . company-select-next)
              ("\C-n" . company-select-next)
              ("\C-p" . company-select-previous)
              ("\C-d" . company-show-doc-buffer)
              ("M-." . company-show-location))
  :config (global-company-mode 1))

(use-package company-posframe
  :demand t
  :after (company)
  :custom
  (company-posframe-quickhelp-delay 0.1)
  (company-posframe-show-metadata t)
  :config (company-posframe-mode 1))

;; (use-package company-quickhelp
;;   :demand t
;;   :after (company)
;;   :custom (company-quickhelp-delay 0.7)
;;   :config (company-quickhelp-mode 1))

(provide 'shinmera-company)
