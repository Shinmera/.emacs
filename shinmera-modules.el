;; -*- mode: elisp; lexical-binding: t; -*-
(require 'cl-lib)

(defvar shinmera-module-list
  '(:general :spell :pass :mail :perspective :treemacs :company :flycheck :magit :paredit :lisp :tex :web :js :c :java :shell :glsl :elixir :arduino :go :python :lua :rust :misc :vim :native :treesitter))

(defvar shinmera-default-module-list
  '(:general :spell :pass :mail :perspective :treemacs :company :flycheck :magit :paredit :lisp :tex :web :js :c :java :shell :glsl :elixir :arduino :go :python :lua :rust :misc))

(defcustom shinmera-modules (copy-sequence shinmera-default-module-list)
  "Which modules to load on startup"
  :type `(set ,@(cl-loop for module in shinmera-module-list
                         collect `(const ,module)))
  :group 'shinmera)

(dolist (module shinmera-modules)
  (let ((name (intern (concat "shinmera-" (substring (symbol-name module) 1)))))
    (require name)))

(provide 'shinmera-modules)
