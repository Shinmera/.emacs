;; -*- mode: elisp; lexical-binding: t; -*-
(require 'cl-lib)

(defvar shinmera-module-list
  '(:general :keys :spell :pass :mail :perspective :treemacs :company :flycheck :magit :paredit :lisp :tex :web :js :c :java :shell :markless :markdown :glsl :elixir :arduino :go :python))

(defcustom shinmera-modules (copy-sequence shinmera-module-list)
  "Which modules to load on startup"
  :type `(set ,@(cl-loop for module in shinmera-module-list
                         collect `(const ,module)))
  :group 'shinmera)

(dolist (module shinmera-modules)
  (let ((name (intern (concat "shinmera-" (substring (symbol-name module) 1)))))
    (require name)))

(provide 'shinmera-modules)
