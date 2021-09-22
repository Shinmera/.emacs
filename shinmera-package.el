;;;;;;
;; Set up package management
(require 'package)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;;;;;;;
;; Autoinstall packages
(require 'cl)
(defvar *package-lists-fetched* nil)

(defun soft-fetch-package-lists ()
  (unless *package-lists-fetched*
    (package-refresh-contents)
    (setf *package-lists-fetched* t)))

(defun package-locally-installed-p (package)
  (assq package package-alist))

(defun ensure-installed (&rest packages)
  (unless (cl-loop for package in packages
                   always (package-locally-installed-p package))
    (message "Trying to install: %s" packages)
    (soft-fetch-package-lists)
    (dolist (package packages)
      (unless (package-locally-installed-p package)
        (package-install package)))))

(provide 'shinmera-package)
