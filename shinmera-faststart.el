;;; -*- lexical-binding: t; -*-
;;;; Various things to speed up the emacs startup time
(defvar comp-deferred-compliation)
(setq comp-deferred-compilation t)
(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)
(setq site-run-file nil)
(setq inhibit-compacting-font-caches t)

(when (boundp 'read-process-output-max)
  (setq read-process-output-max 1048576))

(defmacro define-hook (hook args &rest body)
  `(add-hook ',hook (lambda ,args ,@body)))

;; Hide bars
(menu-bar-mode -1)
(unless (and (display-graphic-p) (eq system-type 'darwin))
  (push '(menu-bar-lines . 0) default-frame-alist))
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Strangle the GC a bit for better startup times
(defvar shinmera-gc-cons-threshold 16777216)
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6
      garbage-collection-messages t)
(define-hook emacs-startup-hook ()
  (setq gc-cons-threshold shinmera-gc-cons-threshold
        gc-cons-percentage 0.1))
(define-hook minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))
(define-hook minibuffer-exit-hook ()
  (run-at-time 1 nil (lambda () (setq gc-cons-threshold shinmera-gc-cons-threshold))))

;; avoid special file handling during startup
(defvar shinmera--file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(define-hook emacs-startup-hook ()
  (setq file-name-handler-alist shinmera--file-name-handler-alist))

(provide 'shinmera-faststart)
