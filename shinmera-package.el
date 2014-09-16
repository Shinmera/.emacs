(provide 'shinmera-package)

;;;;;;
;; Set up package management
(require 'package)
(add-to-list 'package-archives       '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives       '("melpa"     . "http://melpa.milkbox.net/packages/"))
(package-initialize)
