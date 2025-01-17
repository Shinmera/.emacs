(require 'shinmera-straight)

(use-package auctex
  :commands (auctex-mode)
  :mode ("\\.tex\\'" . auctex-mode)
  :hook
  (TeX-mode . (lambda () (TeX-fold-mode 1)))
  :custom
  (TeX-engine 'luatex)
  (LaTeX-babel-hyphen nil)
  (TeX-master nil)
  (TeX-PDF-mode t)
  (TeX-parse-self t)
  (TeX-auto-save t)
  (TeX-source-correlate-method 'synctex)
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-start-server t)
  (TeX-view-program-list '(("Okular" "okular --unique %o#src:%n%b")))
  (TeX-view-program-selection '((output-pdf "Okular"))))

(use-package company-auctex
  :demand t
  :after (company auctex)
  :config (add-to-list 'company-backends 'company-auctex))

(use-package company-bibtex
  :demand t
  :after (company auctex)
  :config (add-to-list 'company-backends 'company-bibtex))

(use-package citar
  :demand t
  :after (auctex)
  :hook (LaTeX-mode . citar-capf-setup))

(provide 'shinmera-tex)
