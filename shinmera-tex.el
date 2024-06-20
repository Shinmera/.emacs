(require 'shinmera-straight)

(use-package auctex
  :commands (auctex-mode)
  :mode ("\\.tex\\'" . auctex-mode)
  :hook
  (TeX-mode . (lambda () (TeX-fold-mode 1)))
  (TeX-mode . LaTeX-math-mode)
  :custom
  (TeX-engine 'luatex)
  (LaTeX-math-abbrev-prefix "C-a")
  (LaTeX-babel-hyphen nil)
  (TeX-master nil)
  (TeX-PDF-mode t)
  (TeX-parse-self t)
  (TeX-auto-save t)
  (TeX-source-correlate-method 'synctex)
  (TeX-source-correlate-mode t)
  (TeX-source-correlate-start-server t)
  (TeX-view-program-list '(("Okular" "okular --unique %o#src:%n%b")))
  (TeX-view-program-selection '((output-pdf "Okular")))
  :config
  (add-to-list 'TeX-command-list
               '("Glossary" "makeglossaries %s" TeX-run-command nil
                 (latex-mode)
                 :help "Run makeglossaries script, which will choose xindy or makeindex") t)
  (add-to-list 'TeX-command-list
               '("GLaTeX" "%`%l%(mode)%' %t && makeglossaries %s && %`%l%(mode)%' %t" TeX-run-TeX nil
                 (latex-mode)
                 :help "Run LaTeX with Glossary processing"))
  (add-to-list 'TeX-command-list
               '("BLaTeX" "%`%l%(mode)%' %t && biber %s && %`%l%(mode)%' %t" TeX-run-TeX nil
                 (latex-mode)
                 :help "Run LaTeX with BibLaTeX processing")))

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
