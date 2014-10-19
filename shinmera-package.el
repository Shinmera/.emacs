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
(defvar *package-lists-fetched* nil)

(defun soft-fetch-package-lists ()
  (unless *package-lists-fetched*
    (package-refresh-contents)
    (setf *package-lists-fetched* t)))

(defun packages-installed-p (&rest packages)
  (loop for package in packages
        always (package-installed-p package)))

(defun ensure-installed (&rest packages)
  (unless (apply #'packages-installed-p packages)
    (soft-fetch-package-lists)
    (dolist (package packages)
      (unless (package-installed-p package)
        (package-install package)))))
