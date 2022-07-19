(require 'shinmera-package)

(when (featurep 'shinmera-package)
  (ensure-installed 'markless))

(autoload 'markless-mode "markless" "" t nil)
(add-to-list 'auto-mode-alist '("\\.mess\\'" . markless-mode))
(add-to-list 'auto-mode-alist '("\\.spess\\'" . markless-mode))
(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "markless" '("markless-")))

(provide 'shinmera-markless)
