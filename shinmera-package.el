(provide 'shinmera-package)

;;;;;;
;; Set up package management
(require 'package)
(add-to-list 'package-archives       '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives       '("melpa"     . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;;;;;;;
;; Autoinstall packages
(require 'cl)
(defvar *prelude-packages*
  '(multiple-cursors expand-region auto-complete ecb
    web-mode slime ac-slime paredit sublime-themes powerline
    auctex markdown-mode rainbow-mode))

(defun prelude-packages-installed-p ()
  (loop for package in *prelude-packages*
        always (package-installed-p package)))

(unless (prelude-packages-installed-p)
  (package-refresh-contents)
  (dolist (package *prelude-packages*)
    (when (not (package-installed-p package))
      (package-install package))))
