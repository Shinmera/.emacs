(require 'shinmera-straight)

(use-package dockerfile-mode
  :commands (dockerfile-mode)
  :mode ("\\'Dockerfile\\'" . dockerfile-mode))

(use-package yaml-mode
  :commands (yaml-mode)
  :mode
  ("\\.yml\\'" . yaml-mode)
  ("\\.ksy\\'" . yaml-mode))

(use-package markdown-mode
  :commands (markdown-mode)
  :mode
  ("\\.md\\'" . markdown-mode)
  ("\\.markdown\\'" . markdown-mode)
  :hook
  (markdown-mode . olivetti-mode)
  (gfm-mode . olivetti-mode))

(use-package markless
  :commands (markless-mode)
  :mode
  ("\\.mess\\'" . markless-mode)
  ("\\.markless\\'" . markless-mode)
  :hook (markless-mode . olivetti-mode))

(use-package csv-mode
  :commands (csv-mode)
  :mode ("\\.csv\\'" . csv-mode))

(use-package git-modes
  :commands (gitattributes-mode gitconfig-mode gitignore-mode)
  :mode
  ("\\'\\.gitattributes\\'" . gitattributes-mode)
  ("\\'\\.gitconfig" . gitconfig-mode)
  ("\\'\\.gitmodules" . gitconfig-mode)
  ("\\'\\.gitignore" . gitignore-mode))

(use-package bnf-mode
  :commands (bnf-mode)
  :mode ("\\.bnf\\'" . bnf-mode))

(use-package nginx-mode
  :commands nginx-mode)

(use-package gdscript-mode
  :commands (gdscript-mode)
  :mode ("\\.gd\\'" . gdscript-mode))

(use-package json-mode
  :commands (json-mode)
  :mode ("\\.json\\'" . json-mode))

(use-package sql-indent
  :config
  (sql-set-product 'postgres)
  (let* ((postgres (alist-get 'postgres sql-product-alist))
         (syntax (plist-get postgres :syntax-alist)))
    (plist-put postgres :syntax-alist (cons '(?\" . "\"") syntax))))

(provide 'shinmera-misc)
