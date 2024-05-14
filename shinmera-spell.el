(require 'shinmera-straight)

(setq used-spelling-dictionaries '("en_GB" "en_US" "de_CH"))

(use-package jinx
  :defer 2
  :custom (jinx-languages (car used-spelling-dictionaries))
  :config (global-jinx-mode))

(use-package ispell
  :demand t
  :custom (ispell-dictionary (car used-spelling-dictionaries)))

(use-package flyspell
  :commands (flyspell-prog-mode flyspell-mode)
  :hook
  (slime-mode . flyspell-prog-mode)
  (emacs-lisp-mode . flyspell-prog-mode)
  (TeX-mode . flyspell-prog-mode)
  (text-mode . flyspell-mode)
  (markless-mode . flyspell-mode)
  (markdown-mode . flyspell-mode))

(defun switch-dictionary ()
  (interactive)
  (let* ((old ispell-current-dictionary)
    	 (new (nth (mod (1+ (cl-position old used-spelling-dictionaries))
                        (length used-spelling-dictionaries))
                   used-spelling-dictionaries)))
    (ispell-change-dictionary new)
    (message "Dictionary switched from %s to %s" old new)))

(provide 'shinmera-spell)
