(provide 'shinmera-tex)

(when (featurep 'shinmera-package)
  (ensure-installed 'auctex))

;;;;;;
;; Set up TeX and AUCTeX
(autoload 'auctex-mode "tex" "LaTeX Editing Mode" t nil)

(setq
 LaTeX-math-abbrev-prefix             "C-a"
 LaTeX-babel-hyphen                   nil
 TeX-master                           nil
 TeX-PDF-mode                         t
 TeX-parse-self                       t
 TeX-auto-save                        t
 TeX-source-correlate-method          'synctex
 TeX-source-correlate-mode            t
 TeX-source-correlate-start-server    t
 TeX-view-program-list                '(("Okular" "okular --unique %o#src:%n%b"))
 TeX-view-program-selection           '((output-pdf "Okular")))

(eval-after-load "tex"   '(progn
                           (add-to-list 'TeX-command-list
                            '("Glossary" "makeglossaries %s" TeX-run-command nil
                              (latex-mode)
                              :help "Run makeglossaries script, which will choose xindy or makeindex") t)
                           (add-to-list 'TeX-command-list
                            '("GLaTeX" "%`%l%(mode)%' %t && makeglossaries %s && %`%l%(mode)%' %t" TeX-run-TeX nil
                              (latex-mode)
                              :help "Run LaTeX"))))

(add-hook 'TeX-mode-hook              #'(lambda () (TeX-fold-mode 1)))
(add-hook 'TeX-mode-hook              #'LaTeX-math-mode)
(add-hook 'TeX-mode-hook              #'flyspell-mode)

